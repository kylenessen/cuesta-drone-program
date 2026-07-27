#!/usr/bin/env python3
"""
Google Docs review workflow helper for this repo.

The repo stays the source of truth. This tool compiles a course outline plus
every wiki article it links into a single review document, pushes it to
Google Drive as a native Google Doc shared comment-only, and pulls reviewer
comments back into the repo as Markdown, attributed to the source wiki file
where possible.

Supports:
  - OAuth login against Google (Drive scope limited to files this app creates)
  - compile: build one combined Markdown + docx review document per course
  - push:    upload/convert to a Google Doc, share comment-only, remember the mapping
  - pull:    fetch comments and replies back into feedback/gdocs/ as Markdown
  - status:  show pushed docs, links, and comment counts
  - share:   grant additional reviewers comment access by email
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import pathlib
import re
import shutil
import subprocess
import time
import urllib.error
import urllib.parse
import urllib.request
import uuid

try:
    import tomllib  # py3.11+
except Exception:  # pragma: no cover
    tomllib = None


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
STATE_DIR = REPO_ROOT / ".gdocs"
CREDS_PATH = STATE_DIR / "credentials.json"
SYNC_PATH = STATE_DIR / "sync.json"
SNAPSHOT_DIR = STATE_DIR / "snapshots"
CONFIG_PATH = REPO_ROOT / "gdocs.toml"
BUILD_DIR = REPO_ROOT / "build" / "review"
FEEDBACK_DIR = REPO_ROOT / "feedback" / "gdocs"

OAUTH_SCOPE = "https://www.googleapis.com/auth/drive.file"
AUTH_URL = "https://accounts.google.com/o/oauth2/v2/auth"
TOKEN_URL = "https://oauth2.googleapis.com/token"
DRIVE_API = "https://www.googleapis.com/drive/v3"
DRIVE_UPLOAD = "https://www.googleapis.com/upload/drive/v3"
DOC_MIME = "application/vnd.google-apps.document"
DOCX_MIME = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"

LINK_RE = re.compile(r"\[([^\]]+)\]\(([^)\s]+)\)")
HEADING_RE = re.compile(r"^(#{1,6})\s+(.*?)\s*$", re.MULTILINE)

REVIEWER_NOTE = (
    "*How to read this document: the course outline at the top is the part "
    "under review. Every topic in the outline links to a full article in the "
    "appendix below, included so you can see exactly what a topic covers. "
    "You do not need to read the appendix. Follow a link when you want more "
    "depth, and leave comments anywhere, on the outline or the articles.*"
)


# ---------------------------------------------------------------------------
# Config, state, and small helpers
# ---------------------------------------------------------------------------


def _now_utc_iso() -> str:
    return dt.datetime.now(dt.UTC).isoformat().replace("+00:00", "Z")


def _load_toml(path: pathlib.Path) -> dict:
    if not path.exists():
        return {}
    if tomllib is None:
        raise SystemExit("tomllib not available. Use Python 3.11+.")
    return tomllib.loads(path.read_text(encoding="utf-8"))


def _load_json(path: pathlib.Path, default):
    if not path.exists():
        return default
    return json.loads(path.read_text(encoding="utf-8"))


def _save_json(path: pathlib.Path, obj) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def _cfg_get(cfg: dict, *keys: str, env: str | None = None, required: bool = False):
    cur = cfg
    for k in keys:
        if not isinstance(cur, dict) or k not in cur:
            cur = None
            break
        cur = cur[k]
    value = cur
    if value is None and env:
        value = os.environ.get(env)
    if required and (value is None or value == ""):
        where = ".".join(keys) + (f" or ${env}" if env else "")
        raise SystemExit(f"Missing required config: {where}")
    return value


def _slug(s: str) -> str:
    s = s.lower()
    s = re.sub(r"[^a-z0-9]+", "-", s).strip("-")
    return s or "doc"


def _rel(path: pathlib.Path) -> str:
    return str(path.resolve().relative_to(REPO_ROOT))


def _git_rev() -> str | None:
    try:
        out = subprocess.check_output(
            ["git", "rev-parse", "--short", "HEAD"], cwd=REPO_ROOT, text=True
        ).strip()
        return out or None
    except Exception:
        return None


# ---------------------------------------------------------------------------
# HTTP
# ---------------------------------------------------------------------------


def _http(
    method: str,
    url: str,
    *,
    headers: dict | None = None,
    body: bytes | None = None,
    timeout_s: int = 120,
) -> bytes:
    req = urllib.request.Request(url, method=method, data=body, headers=headers or {})
    retries = 4
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=timeout_s) as resp:
                return resp.read()
        except urllib.error.HTTPError as e:
            should_retry = e.code in {429, 500, 502, 503, 504} and attempt < retries - 1
            if should_retry:
                retry_after = e.headers.get("Retry-After")
                sleep_s = int(retry_after) if retry_after and retry_after.isdigit() else (2**attempt)
                time.sleep(min(sleep_s, 20))
                continue
            details = None
            try:
                details = e.read().decode("utf-8", errors="replace")
            except Exception:
                pass
            raise SystemExit(f"HTTP {e.code} {method} {url}\n{details}") from e
        except urllib.error.URLError as e:
            if attempt < retries - 1:
                time.sleep(min(2**attempt, 10))
                continue
            raise SystemExit(f"Network error {method} {url}: {e}") from e
    raise SystemExit(f"Unreachable retry loop for {method} {url}")


def _api_json(method: str, url: str, *, token: str, data: dict | None = None) -> dict | None:
    headers = {"Authorization": f"Bearer {token}", "Accept": "application/json"}
    body = None
    if data is not None:
        body = json.dumps(data).encode("utf-8")
        headers["Content-Type"] = "application/json"
    payload = _http(method, url, headers=headers, body=body)
    if not payload:
        return None
    return json.loads(payload.decode("utf-8"))


def _token_request(form: dict) -> dict:
    body = urllib.parse.urlencode(form).encode("utf-8")
    payload = _http(
        "POST",
        TOKEN_URL,
        headers={"Content-Type": "application/x-www-form-urlencoded"},
        body=body,
    )
    return json.loads(payload.decode("utf-8"))


# ---------------------------------------------------------------------------
# OAuth
# ---------------------------------------------------------------------------


def _oauth_value(args, creds: dict, cfg: dict, key: str, env: str) -> str | None:
    return getattr(args, key, None) or creds.get(key) or _cfg_get(cfg, "oauth", key, env=env)


def cmd_oauth_url(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    client_id = _oauth_value(args, creds, cfg, "client_id", "GDOCS_CLIENT_ID")
    redirect_uri = (
        _oauth_value(args, creds, cfg, "redirect_uri", "GDOCS_REDIRECT_URI")
        or "http://127.0.0.1:8123/callback"
    )
    if not client_id:
        raise SystemExit("Missing client_id. Pass --client-id or set $GDOCS_CLIENT_ID.")
    q = urllib.parse.urlencode(
        {
            "client_id": client_id,
            "redirect_uri": redirect_uri,
            "response_type": "code",
            "scope": OAUTH_SCOPE,
            "access_type": "offline",
            "prompt": "consent",
        }
    )
    print(f"{AUTH_URL}?{q}")


def cmd_oauth_exchange(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    client_id = _oauth_value(args, creds, cfg, "client_id", "GDOCS_CLIENT_ID")
    client_secret = _oauth_value(args, creds, cfg, "client_secret", "GDOCS_CLIENT_SECRET")
    redirect_uri = (
        _oauth_value(args, creds, cfg, "redirect_uri", "GDOCS_REDIRECT_URI")
        or "http://127.0.0.1:8123/callback"
    )
    if not client_id or not client_secret:
        raise SystemExit("Missing client_id/client_secret. Provide flags, config, or env vars.")
    token = _token_request(
        {
            "grant_type": "authorization_code",
            "client_id": client_id,
            "client_secret": client_secret,
            "redirect_uri": redirect_uri,
            "code": args.code,
        }
    )
    expires_at = dt.datetime.now(dt.UTC) + dt.timedelta(seconds=int(token.get("expires_in", 0)))
    creds.update(
        {
            "client_id": client_id,
            "client_secret": client_secret,
            "redirect_uri": redirect_uri,
            "access_token": token.get("access_token"),
            "access_token_expires_at": expires_at.isoformat().replace("+00:00", "Z"),
            "refresh_token": token.get("refresh_token") or creds.get("refresh_token"),
            "updated_at": _now_utc_iso(),
        }
    )
    _save_json(CREDS_PATH, creds)
    print(f"Wrote {CREDS_PATH}")


def _refresh_access_token(cfg: dict, creds: dict) -> dict:
    client_id = creds.get("client_id") or _cfg_get(
        cfg, "oauth", "client_id", env="GDOCS_CLIENT_ID", required=True
    )
    client_secret = creds.get("client_secret") or _cfg_get(
        cfg, "oauth", "client_secret", env="GDOCS_CLIENT_SECRET", required=True
    )
    refresh_token = creds.get("refresh_token") or os.environ.get("GDOCS_REFRESH_TOKEN")
    if not refresh_token:
        raise SystemExit("No refresh token. Run the oauth url/exchange flow first.")
    token = _token_request(
        {
            "grant_type": "refresh_token",
            "client_id": client_id,
            "client_secret": client_secret,
            "refresh_token": refresh_token,
        }
    )
    expires_at = dt.datetime.now(dt.UTC) + dt.timedelta(seconds=int(token.get("expires_in", 0)))
    creds.update(
        {
            "client_id": client_id,
            "client_secret": client_secret,
            "access_token": token["access_token"],
            "access_token_expires_at": expires_at.isoformat().replace("+00:00", "Z"),
            "refresh_token": token.get("refresh_token") or refresh_token,
            "updated_at": _now_utc_iso(),
        }
    )
    return creds


def _access_token(cfg: dict, creds: dict) -> str:
    access_token = creds.get("access_token")
    expires_at = creds.get("access_token_expires_at")
    if access_token and expires_at:
        try:
            expires_dt = dt.datetime.fromisoformat(expires_at.replace("Z", "+00:00"))
            if dt.datetime.now(dt.UTC) < expires_dt - dt.timedelta(minutes=2):
                return access_token
        except Exception:
            pass
    creds = _refresh_access_token(cfg, creds)
    _save_json(CREDS_PATH, creds)
    return creds["access_token"]


# ---------------------------------------------------------------------------
# Compile: outline + linked wiki articles -> one review document
# ---------------------------------------------------------------------------


def _resolve_md_link(base_dir: pathlib.Path, target: str) -> pathlib.Path | None:
    target = target.split("#", 1)[0]
    if not target or "://" in target or target.startswith("mailto:"):
        return None
    if not target.endswith(".md"):
        return None
    candidate = (base_dir / urllib.parse.unquote(target)).resolve()
    if candidate.exists() and REPO_ROOT in candidate.parents:
        return candidate
    return None


def _article_title(text: str, fallback: str) -> str:
    m = HEADING_RE.search(text)
    if m and len(m.group(1)) == 1:
        return m.group(2).strip()
    return fallback


def _demote_headings(text: str, by: int) -> str:
    def repl(m: re.Match) -> str:
        level = min(6, len(m.group(1)) + by)
        return "#" * level + " " + m.group(2)

    return HEADING_RE.sub(repl, text)


def _rewrite_links(text: str, base_dir: pathlib.Path, anchors: dict[str, str]) -> str:
    def repl(m: re.Match) -> str:
        label, target = m.group(1), m.group(2)
        if target.startswith("#"):
            return label  # in-page anchors do not survive compilation
        resolved = _resolve_md_link(base_dir, target)
        if resolved is None:
            if "://" in target or target.startswith("mailto:"):
                return m.group(0)
            return label  # local link to a file outside this review doc
        slug = anchors.get(_rel(resolved))
        if slug:
            return f"[{label}](#{slug})"
        return label

    return LINK_RE.sub(repl, text)


def _doc_name_from_title(title: str) -> str:
    name = re.sub(r"\s*-\s*Topic Outline\s*$", "", title).strip()
    return f"{name} (Review Draft)"


def compile_course(outline_path: pathlib.Path) -> tuple[pathlib.Path, pathlib.Path, dict]:
    """Build the combined review markdown, its docx, and a manifest."""
    text = outline_path.read_text(encoding="utf-8")
    title = _article_title(text, outline_path.stem)
    doc_name = _doc_name_from_title(title)

    # Collect linked wiki articles in order of first appearance.
    articles: list[pathlib.Path] = []
    for m in LINK_RE.finditer(text):
        resolved = _resolve_md_link(outline_path.parent, m.group(2))
        if resolved and resolved != outline_path.resolve() and resolved not in articles:
            articles.append(resolved)

    # Assign a stable anchor slug per article, disambiguating stem collisions.
    anchors: dict[str, str] = {}
    used: set[str] = set()
    for art in articles:
        slug = _slug(art.stem)
        if slug in used:
            slug = _slug(f"{art.parent.name}-{art.stem}")
        used.add(slug)
        anchors[_rel(art)] = slug

    # Outline section: drop its H1 (it becomes the doc title), keep the rest.
    outline_body = HEADING_RE.sub(
        lambda m: m.group(0) if len(m.group(1)) > 1 else "", text, count=1
    ).strip()
    outline_body = _rewrite_links(outline_body, outline_path.parent, anchors)

    parts = [
        f"# {doc_name}",
        "",
        REVIEWER_NOTE,
        "",
        '# Course Outline {#course-outline}',
        "",
        outline_body,
        "",
        "# Appendix: Wiki Articles",
        "",
        "*Reference material for the outline above. Each article is the full "
        "text behind one outline topic. Read as much or as little as is useful.*",
        "",
    ]

    manifest_articles = []
    for art in articles:
        art_text = art.read_text(encoding="utf-8")
        art_title = _article_title(art_text, art.stem)
        slug = anchors[_rel(art)]
        # Strip the article's own H1; we re-add it with an explicit anchor.
        art_body = HEADING_RE.sub(
            lambda m: m.group(0) if len(m.group(1)) > 1 else "", art_text, count=1
        ).strip()
        art_body = _rewrite_links(art_body, art.parent, anchors)
        art_body = _demote_headings(art_body, 1)
        parts += [
            f"## {art_title} {{#{slug}}}",
            "",
            art_body,
            "",
            "[Back to course outline](#course-outline)",
            "",
        ]
        manifest_articles.append({"slug": slug, "title": art_title, "path": _rel(art)})

    combined = "\n".join(parts).rstrip() + "\n"

    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    md_path = BUILD_DIR / f"{outline_path.stem}.md"
    docx_path = BUILD_DIR / f"{outline_path.stem}.docx"
    md_path.write_text(combined, encoding="utf-8")
    _markdown_to_docx(md_path, docx_path)

    manifest = {
        "doc_name": doc_name,
        "outline": _rel(outline_path),
        "outline_title": title,
        "compiled_at": _now_utc_iso(),
        "source_commit": _git_rev(),
        "articles": manifest_articles,
    }
    _save_json(BUILD_DIR / f"{outline_path.stem}.manifest.json", manifest)
    return md_path, docx_path, manifest


def _markdown_to_docx(md_path: pathlib.Path, docx_path: pathlib.Path) -> None:
    pandoc = shutil.which("pandoc")
    cmd = [
        pandoc or "pandoc",
        "-f",
        "markdown",
        "-t",
        "docx",
        "--wrap=none",
        "-o",
        str(docx_path),
        str(md_path),
    ]
    if pandoc:
        subprocess.check_call(cmd, cwd=REPO_ROOT)
        return
    try:
        import pypandoc  # type: ignore

        pypandoc.convert_file(
            str(md_path), "docx", format="markdown", outputfile=str(docx_path), extra_args=["--wrap=none"]
        )
    except ImportError as e:
        raise SystemExit(
            "pandoc is required to build the review docx. Install it "
            "(brew install pandoc) or `pip install pypandoc-binary`."
        ) from e


def _course_targets(cfg: dict, args) -> list[pathlib.Path]:
    if getattr(args, "path", None):
        paths = [args.path]
    elif getattr(args, "all", False):
        paths = _cfg_get(cfg, "review", "courses") or []
        if not paths:
            raise SystemExit("No courses configured. Set review.courses in gdocs.toml.")
    else:
        raise SystemExit("Pass an outline path or --all.")
    out = []
    for p in paths:
        path = pathlib.Path(p)
        if not path.is_absolute():
            path = (REPO_ROOT / path).resolve()
        if not path.exists():
            raise SystemExit(f"Outline not found: {p}")
        out.append(path)
    return out


def cmd_compile(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    for outline in _course_targets(cfg, args):
        md_path, docx_path, manifest = compile_course(outline)
        n = len(manifest["articles"])
        print(f"{manifest['doc_name']}: {n} articles -> {_rel(docx_path)}")


# ---------------------------------------------------------------------------
# Push
# ---------------------------------------------------------------------------


def _multipart_upload_body(metadata: dict, content: bytes, content_type: str) -> tuple[bytes, str]:
    boundary = f"gdocs-cli-{uuid.uuid4().hex}"
    parts = [
        f"--{boundary}\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n".encode()
        + json.dumps(metadata).encode("utf-8"),
        f"\r\n--{boundary}\r\nContent-Type: {content_type}\r\n\r\n".encode() + content,
        f"\r\n--{boundary}--\r\n".encode(),
    ]
    return b"".join(parts), f"multipart/related; boundary={boundary}"


def _drive_upload_docx(
    token: str, docx_path: pathlib.Path, doc_name: str, *, file_id: str | None, folder_id: str | None
) -> dict:
    metadata: dict = {"name": doc_name, "mimeType": DOC_MIME}
    if file_id:
        url = f"{DRIVE_UPLOAD}/files/{file_id}?uploadType=multipart&fields=id,name,webViewLink"
        method = "PATCH"
    else:
        if folder_id:
            metadata["parents"] = [folder_id]
        url = f"{DRIVE_UPLOAD}/files?uploadType=multipart&fields=id,name,webViewLink"
        method = "POST"
    body, content_type = _multipart_upload_body(metadata, docx_path.read_bytes(), DOCX_MIME)
    payload = _http(
        method,
        url,
        headers={
            "Authorization": f"Bearer {token}",
            "Content-Type": content_type,
            "Accept": "application/json",
        },
        body=body,
        timeout_s=300,
    )
    return json.loads(payload.decode("utf-8"))


def _share_anyone_commenter(token: str, file_id: str) -> None:
    _api_json(
        "POST",
        f"{DRIVE_API}/files/{file_id}/permissions",
        token=token,
        data={"role": "commenter", "type": "anyone"},
    )


def _share_with_emails(token: str, file_id: str, emails: list[str], notify: bool) -> None:
    for email in emails:
        q = urllib.parse.urlencode({"sendNotificationEmail": "true" if notify else "false"})
        _api_json(
            "POST",
            f"{DRIVE_API}/files/{file_id}/permissions?{q}",
            token=token,
            data={"role": "commenter", "type": "user", "emailAddress": email},
        )


def _snapshot(outline: pathlib.Path, md_path: pathlib.Path) -> None:
    SNAPSHOT_DIR.mkdir(parents=True, exist_ok=True)
    shutil.copy2(md_path, SNAPSHOT_DIR / f"{outline.stem}.md")
    manifest_src = BUILD_DIR / f"{outline.stem}.manifest.json"
    if manifest_src.exists():
        shutil.copy2(manifest_src, SNAPSHOT_DIR / f"{outline.stem}.manifest.json")


def cmd_push(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    token = _access_token(cfg, creds)
    folder_id = args.folder_id or _cfg_get(cfg, "drive", "folder_id", env="GDOCS_FOLDER_ID")
    share_mode = args.share or _cfg_get(cfg, "drive", "share") or "anyone"
    reviewers = _cfg_get(cfg, "drive", "reviewers") or []

    sync = _load_json(SYNC_PATH, {})
    for outline in _course_targets(cfg, args):
        md_path, docx_path, manifest = compile_course(outline)
        key = _rel(outline)
        entry = sync.get(key, {})
        file_id = None if args.new else entry.get("file_id")
        result = _drive_upload_docx(
            token, docx_path, manifest["doc_name"], file_id=file_id, folder_id=folder_id
        )
        created = file_id is None
        file_id = result["id"]
        if created:
            if share_mode == "anyone":
                _share_anyone_commenter(token, file_id)
            if reviewers:
                _share_with_emails(token, file_id, list(reviewers), args.notify)
        _snapshot(outline, md_path)
        entry.update(
            {
                "file_id": file_id,
                "doc_name": manifest["doc_name"],
                "web_view_link": result.get("webViewLink") or entry.get("web_view_link"),
                "pushed_at": _now_utc_iso(),
                "source_commit": manifest["source_commit"],
                "share": share_mode,
            }
        )
        sync[key] = entry
        _save_json(SYNC_PATH, sync)
        verb = "Created" if created else "Updated"
        print(f"{verb}: {manifest['doc_name']}")
        print(f"  {entry.get('web_view_link') or file_id}")


def cmd_share(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    token = _access_token(cfg, creds)
    sync = _load_json(SYNC_PATH, {})
    key = _rel(pathlib.Path(args.path) if pathlib.Path(args.path).is_absolute() else REPO_ROOT / args.path)
    entry = sync.get(key)
    if not entry:
        raise SystemExit(f"Not pushed yet: {key}")
    _share_with_emails(token, entry["file_id"], args.email, args.notify)
    print(f"Shared {entry['doc_name']} with {', '.join(args.email)} (commenter)")


# ---------------------------------------------------------------------------
# Pull
# ---------------------------------------------------------------------------


def _list_comments(token: str, file_id: str) -> list[dict]:
    fields = (
        "nextPageToken,comments(id,createdTime,modifiedTime,resolved,deleted,"
        "author(displayName),content,quotedFileContent(value),"
        "replies(id,createdTime,author(displayName),content,action,deleted))"
    )
    comments: list[dict] = []
    page_token = None
    while True:
        params = {"fields": fields, "pageSize": "100"}
        if page_token:
            params["pageToken"] = page_token
        url = f"{DRIVE_API}/files/{file_id}/comments?{urllib.parse.urlencode(params)}"
        data = _api_json("GET", url, token=token) or {}
        comments.extend(data.get("comments") or [])
        page_token = data.get("nextPageToken")
        if not page_token:
            break
    return [c for c in comments if not c.get("deleted")]


def _strip_html(text: str) -> str:
    text = re.sub(r"<br\s*/?>", "\n", text)
    text = re.sub(r"<[^>]+>", "", text)
    return text.strip()


def _normalize(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip().lower()


def _attribute_quote(quote: str, snapshot_md: str, manifest: dict) -> str | None:
    """Best-effort: map a comment's quoted text back to the source file."""
    if not quote or not snapshot_md:
        return None
    hay = _normalize(snapshot_md)
    needle = _normalize(quote)
    pos = hay.find(needle[:200])
    if pos < 0:
        return None
    # Recover an approximate offset in the original text by walking both
    # normalized and original strings would be heavy; instead find the last
    # article anchor heading before the quote in the normalized stream.
    best = None
    for art in manifest.get("articles", []):
        marker = _normalize(f"## {art['title']} {{#{art['slug']}}}")
        mpos = hay.find(marker)
        if 0 <= mpos <= pos:
            if best is None or mpos > best[0]:
                best = (mpos, art["path"])
    if best:
        return best[1]
    return manifest.get("outline")


def _stamp_local(iso: str) -> str:
    try:
        d = dt.datetime.fromisoformat(iso.replace("Z", "+00:00"))
        return d.astimezone().strftime("%Y-%m-%d %H:%M")
    except Exception:
        return iso


def _render_feedback(entry: dict, comments: list[dict], snapshot_md: str, manifest: dict) -> str:
    lines = [
        f"# Google Docs feedback: {entry.get('doc_name', '')}",
        "",
        f"Doc: {entry.get('web_view_link', '')}",
        f"Last pulled: {_stamp_local(_now_utc_iso())}",
        "",
        "This file is regenerated on every pull. Resolve comments in the Google",
        "Doc once they are incorporated; resolved comments stay here marked as",
        "resolved until the doc is re-pushed fresh.",
        "",
    ]
    if not comments:
        lines.append("No comments yet.")
        return "\n".join(lines) + "\n"

    open_comments = [c for c in comments if not c.get("resolved")]
    resolved = [c for c in comments if c.get("resolved")]
    lines.append(f"{len(open_comments)} open, {len(resolved)} resolved.")
    lines.append("")

    for c in sorted(comments, key=lambda c: c.get("createdTime", "")):
        author = (c.get("author") or {}).get("displayName", "Unknown")
        status = " (resolved)" if c.get("resolved") else ""
        lines.append(f"## {author}, {_stamp_local(c.get('createdTime', ''))}{status}")
        lines.append("")
        quote = _strip_html((c.get("quotedFileContent") or {}).get("value") or "")
        if quote:
            source = _attribute_quote(quote, snapshot_md, manifest)
            if source:
                lines.append(f"Source: `{source}`")
                lines.append("")
            short = quote if len(quote) <= 300 else quote[:300] + " [...]"
            for qline in short.splitlines():
                lines.append(f"> {qline}")
            lines.append("")
        lines.append(_strip_html(c.get("content") or "(empty)"))
        lines.append("")
        for r in c.get("replies") or []:
            if r.get("deleted"):
                continue
            r_author = (r.get("author") or {}).get("displayName", "Unknown")
            action = r.get("action")
            r_text = _strip_html(r.get("content") or "")
            if action and not r_text:
                r_text = f"({action})"
            lines.append(f"- Reply from {r_author}, {_stamp_local(r.get('createdTime', ''))}: {r_text}")
        if c.get("replies"):
            lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def cmd_pull(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    token = _access_token(cfg, creds)
    sync = _load_json(SYNC_PATH, {})

    if args.path:
        p = pathlib.Path(args.path)
        key = _rel(p if p.is_absolute() else REPO_ROOT / p)
        targets = {key: sync[key]} if key in sync else {}
        if not targets:
            raise SystemExit(f"Not pushed yet: {key}")
    else:
        targets = sync

    if not targets:
        raise SystemExit("Nothing pushed yet. Run push first.")

    FEEDBACK_DIR.mkdir(parents=True, exist_ok=True)
    total = 0
    for key, entry in targets.items():
        stem = pathlib.Path(key).stem
        comments = _list_comments(token, entry["file_id"])
        snapshot_path = SNAPSHOT_DIR / f"{stem}.md"
        manifest_path = SNAPSHOT_DIR / f"{stem}.manifest.json"
        snapshot_md = snapshot_path.read_text(encoding="utf-8") if snapshot_path.exists() else ""
        manifest = _load_json(manifest_path, {})
        out_path = FEEDBACK_DIR / f"{stem}.md"
        out_path.write_text(_render_feedback(entry, comments, snapshot_md, manifest), encoding="utf-8")
        entry["last_pulled_at"] = _now_utc_iso()
        entry["comment_count"] = len(comments)
        sync[key] = entry
        total += len(comments)
        print(f"{entry.get('doc_name', stem)}: {len(comments)} comments -> {_rel(out_path)}")
    _save_json(SYNC_PATH, sync)
    if total == 0:
        print("No comments yet on any pushed doc.")


def cmd_status(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    sync = _load_json(SYNC_PATH, {})
    if not sync:
        print("Nothing pushed yet.")
        return
    creds = _load_json(CREDS_PATH, {})
    token = None
    try:
        token = _access_token(cfg, creds)
    except SystemExit:
        pass
    for key, entry in sync.items():
        line = f"{entry.get('doc_name', key)}\n  outline: {key}\n  pushed:  {entry.get('pushed_at', '?')} (commit {entry.get('source_commit', '?')})"
        if token:
            comments = _list_comments(token, entry["file_id"])
            open_n = sum(1 for c in comments if not c.get("resolved"))
            line += f"\n  comments: {open_n} open, {len(comments) - open_n} resolved"
        line += f"\n  {entry.get('web_view_link', '')}"
        print(line)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="gdocs_cli.py", description=__doc__)
    sub = p.add_subparsers(dest="cmd", required=True)

    oauth = sub.add_parser("oauth", help="OAuth helper commands")
    oauth_sub = oauth.add_subparsers(dest="oauth_cmd", required=True)

    oauth_url = oauth_sub.add_parser("url", help="Print the Google authorization URL")
    oauth_url.add_argument("--client-id", dest="client_id")
    oauth_url.add_argument("--redirect-uri", dest="redirect_uri")
    oauth_url.set_defaults(func=cmd_oauth_url)

    oauth_ex = oauth_sub.add_parser("exchange", help="Exchange an OAuth code for tokens and save them")
    oauth_ex.add_argument("--client-id", dest="client_id")
    oauth_ex.add_argument("--client-secret", dest="client_secret")
    oauth_ex.add_argument("--redirect-uri", dest="redirect_uri")
    oauth_ex.add_argument("--code", required=True)
    oauth_ex.set_defaults(func=cmd_oauth_exchange)

    comp = sub.add_parser("compile", help="Build the combined review markdown and docx for a course")
    comp.add_argument("path", nargs="?", help="Course outline .md path")
    comp.add_argument("--all", action="store_true", help="Compile every course in gdocs.toml review.courses")
    comp.set_defaults(func=cmd_compile)

    push = sub.add_parser("push", help="Compile and upload a course as a comment-only Google Doc")
    push.add_argument("path", nargs="?", help="Course outline .md path")
    push.add_argument("--all", action="store_true", help="Push every course in gdocs.toml review.courses")
    push.add_argument("--new", action="store_true", help="Create a new Doc instead of updating the existing one")
    push.add_argument("--folder-id", help="Drive folder to create the Doc in (first push only)")
    push.add_argument("--share", choices=["anyone", "none"], help="Link sharing mode on create (default: anyone)")
    push.add_argument("--notify", action="store_true", help="Send Google's email notification to reviewers")
    push.set_defaults(func=cmd_push)

    share = sub.add_parser("share", help="Grant reviewers comment access to a pushed doc by email")
    share.add_argument("path", help="Course outline .md path (must be pushed already)")
    share.add_argument("--email", action="append", required=True, help="Reviewer email (repeatable)")
    share.add_argument("--notify", action="store_true", help="Send Google's email notification")
    share.set_defaults(func=cmd_share)

    pull = sub.add_parser("pull", help="Pull comments for pushed docs into feedback/gdocs/")
    pull.add_argument("--path", help="Limit to a specific course outline path")
    pull.set_defaults(func=cmd_pull)

    status = sub.add_parser("status", help="Show pushed docs, links, and comment counts")
    status.set_defaults(func=cmd_status)

    return p


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    args.func(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
