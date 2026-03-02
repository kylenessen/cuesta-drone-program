#!/usr/bin/env python3
"""
Basecamp review workflow helper for this repo.

Supports:
  - OAuth login (creates/updates a refresh token)
  - Project discovery (accounts, projects, vaults)
  - Push a local PDF (or build a .typ to PDF) to Basecamp Docs & Files
  - Pull Basecamp comments back into this repo as Markdown
"""

from __future__ import annotations

import argparse
import datetime as dt
import html
import json
import os
import pathlib
import re
import subprocess
import sys
import time
import urllib.parse
import urllib.request
from html.parser import HTMLParser

try:
    import tomllib  # py3.11+
except Exception:  # pragma: no cover
    tomllib = None


REPO_ROOT = pathlib.Path(__file__).resolve().parents[1]
STATE_DIR = REPO_ROOT / ".basecamp"
CREDS_PATH = STATE_DIR / "credentials.json"
SYNC_PATH = STATE_DIR / "sync.json"
CONFIG_PATH = REPO_ROOT / "basecamp.toml"


class _HTMLToText(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self._chunks: list[str] = []
        self._need_space = False

    def handle_starttag(self, tag: str, attrs) -> None:  # noqa: ANN001
        if tag in {"br", "p", "div", "li"}:
            self._chunks.append("\n")
            self._need_space = False

    def handle_data(self, data: str) -> None:
        if not data:
            return
        text = html.unescape(data)
        if self._need_space and not text[:1].isspace():
            self._chunks.append(" ")
        self._chunks.append(text)
        self._need_space = text[-1:].isalnum()

    def get_text(self) -> str:
        out = "".join(self._chunks)
        out = re.sub(r"\n{3,}", "\n\n", out)
        return out.strip()


def _now_utc_iso() -> str:
    return dt.datetime.now(dt.UTC).isoformat().replace("+00:00", "Z")


def _load_toml(path: pathlib.Path) -> dict:
    if not path.exists():
        return {}
    if tomllib is None:
        raise SystemExit("tomllib not available. Use Python 3.11+.")
    return tomllib.loads(path.read_text(encoding="utf-8"))


def _ensure_state_dir() -> None:
    STATE_DIR.mkdir(parents=True, exist_ok=True)


def _load_json(path: pathlib.Path, default):
    if not path.exists():
        return default
    return json.loads(path.read_text(encoding="utf-8"))


def _save_json(path: pathlib.Path, obj) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def _cfg_get(cfg: dict, *keys: str, env: str | None = None, required: bool = False):
    value = None
    cur = cfg
    for k in keys:
        if not isinstance(cur, dict) or k not in cur:
            cur = None
            break
        cur = cur[k]
    if cur is not None:
        value = cur
    if value is None and env:
        value = os.environ.get(env)
    if required and (value is None or value == ""):
        where = f"{'.'.join(keys)}" + (f" or ${env}" if env else "")
        raise SystemExit(f"Missing required config: {where}")
    return value


def _user_agent(cfg: dict, creds: dict) -> str:
    ua = (
        creds.get("user_agent")
        or _cfg_get(cfg, "basecamp", "user_agent", env="BASECAMP_USER_AGENT")
        or "cuesta-drone-program (Basecamp API script)"
    )
    return ua


def _http_json(
    method: str,
    url: str,
    *,
    access_token: str,
    user_agent: str,
    data: dict | None = None,
    raw_body: bytes | None = None,
    content_type: str | None = None,
    timeout_s: int = 60,
):
    headers = {
        "Authorization": f"Bearer {access_token}",
        "User-Agent": user_agent,
        "Accept": "application/json",
    }
    body = None
    if data is not None:
        body = json.dumps(data).encode("utf-8")
        headers["Content-Type"] = "application/json"
    if raw_body is not None:
        body = raw_body
        if content_type:
            headers["Content-Type"] = content_type

    req = urllib.request.Request(url, method=method, data=body, headers=headers)
    retries = 4
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=timeout_s) as resp:
                payload = resp.read()
                if not payload:
                    return None
                return json.loads(payload.decode("utf-8"))
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


def _http_noauth_json(method: str, url: str, *, data: dict, user_agent: str, timeout_s: int = 60):
    headers = {
        "User-Agent": user_agent,
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    req = urllib.request.Request(url, method=method, data=json.dumps(data).encode("utf-8"), headers=headers)
    retries = 4
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=timeout_s) as resp:
                return json.loads(resp.read().decode("utf-8"))
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


def _refresh_access_token(cfg: dict, creds: dict) -> dict:
    client_id = creds.get("client_id") or _cfg_get(cfg, "oauth", "client_id", env="BASECAMP_CLIENT_ID", required=True)
    client_secret = creds.get("client_secret") or _cfg_get(
        cfg, "oauth", "client_secret", env="BASECAMP_CLIENT_SECRET", required=True
    )
    refresh_token = creds.get("refresh_token") or _cfg_get(
        cfg, "oauth", "refresh_token", env="BASECAMP_REFRESH_TOKEN", required=True
    )

    token = _http_noauth_json(
        "POST",
        "https://launchpad.37signals.com/authorization/token",
        user_agent=_user_agent(cfg, creds),
        data={
            "type": "refresh",
            "client_id": client_id,
            "client_secret": client_secret,
            "refresh_token": refresh_token,
        },
    )

    creds.update(
        {
            "client_id": client_id,
            "client_secret": client_secret,
            "refresh_token": token.get("refresh_token") or refresh_token,
            "access_token": token["access_token"],
            "access_token_expires_at": token.get("expires_at"),
            "updated_at": _now_utc_iso(),
        }
    )
    return creds


def _access_token(cfg: dict, creds: dict) -> str:
    access_token = creds.get("access_token") or os.environ.get("BASECAMP_ACCESS_TOKEN")
    expires_at = creds.get("access_token_expires_at")

    if access_token and expires_at:
        try:
            expires_dt = dt.datetime.fromisoformat(expires_at.replace("Z", "+00:00"))
            if dt.datetime.now(dt.UTC) < expires_dt - dt.timedelta(minutes=2):
                return access_token
        except Exception:
            pass

    creds = _refresh_access_token(cfg, creds)
    _ensure_state_dir()
    _save_json(CREDS_PATH, creds)
    return creds["access_token"]


def _authorization(cfg: dict, creds: dict) -> dict:
    token = _access_token(cfg, creds)
    return _http_json(
        "GET",
        "https://launchpad.37signals.com/authorization.json",
        access_token=token,
        user_agent=_user_agent(cfg, creds),
    )


def _account_id(cfg: dict, creds: dict, auth: dict | None = None, required: bool = True) -> int | None:
    val = (
        creds.get("account_id")
        or _cfg_get(cfg, "basecamp", "account_id", env="BASECAMP_ACCOUNT_ID")
        or os.environ.get("ACCOUNT_ID")
    )
    if val is not None:
        return int(val)
    if not required:
        return None
    if auth is None:
        auth = _authorization(cfg, creds)
    accounts = auth.get("accounts") or []
    if len(accounts) == 1:
        return int(accounts[0]["id"])
    raise SystemExit(
        "Missing Basecamp account_id. Set basecamp.account_id in basecamp.toml or $BASECAMP_ACCOUNT_ID."
    )


def _bucket_id(cfg: dict, creds: dict, required: bool = True) -> int | None:
    val = creds.get("project_id") or _cfg_get(cfg, "basecamp", "project_id", env="BASECAMP_PROJECT_ID")
    if val is None:
        return None if not required else None
    return int(val)


def _vault_id(cfg: dict, creds: dict, required: bool = True) -> int | None:
    val = creds.get("vault_id") or _cfg_get(cfg, "basecamp", "vault_id", env="BASECAMP_VAULT_ID")
    if val is None:
        return None if not required else None
    return int(val)


def _api_base(account_id: int) -> str:
    return f"https://3.basecampapi.com/{account_id}"


def _git_rev() -> str | None:
    try:
        out = subprocess.check_output(["git", "rev-parse", "--short", "HEAD"], cwd=REPO_ROOT, text=True).strip()
        return out or None
    except Exception:
        return None


def _typst_compile(typ_path: pathlib.Path, pdf_path: pathlib.Path) -> None:
    pdf_path.parent.mkdir(parents=True, exist_ok=True)
    try:
        subprocess.check_call(["typst", "compile", str(typ_path), str(pdf_path)], cwd=REPO_ROOT)
    except FileNotFoundError as e:
        raise SystemExit("typst is not installed or not on PATH.") from e


def cmd_accounts(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    auth = _authorization(cfg, creds)
    accounts = auth.get("accounts") or []
    for a in accounts:
        print(f'{a["id"]}\t{a.get("name","")}\t{a.get("product","")}\t{a.get("href","")}')


def cmd_projects(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    auth = _authorization(cfg, creds)
    account_id = args.account_id or _account_id(cfg, creds, auth=auth)
    token = _access_token(cfg, creds)
    base = _api_base(account_id)
    projects = _http_json(
        "GET",
        f"{base}/projects.json",
        access_token=token,
        user_agent=_user_agent(cfg, creds),
    )
    q = (args.query or "").lower().strip()
    for p in projects:
        name = p.get("name", "")
        if q and q not in name.lower():
            continue
        print(f'{p["id"]}\t{name}')


def cmd_project(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    auth = _authorization(cfg, creds)
    account_id = args.account_id or _account_id(cfg, creds, auth=auth)
    token = _access_token(cfg, creds)
    base = _api_base(account_id)
    proj = _http_json(
        "GET",
        f"{base}/projects/{args.project_id}.json",
        access_token=token,
        user_agent=_user_agent(cfg, creds),
    )
    print(json.dumps(proj, indent=2, sort_keys=True))


def cmd_vaults(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    auth = _authorization(cfg, creds)
    account_id = args.account_id or _account_id(cfg, creds, auth=auth)
    token = _access_token(cfg, creds)
    base = _api_base(account_id)
    proj = _http_json(
        "GET",
        f"{base}/projects/{args.project_id}.json",
        access_token=token,
        user_agent=_user_agent(cfg, creds),
    )
    for d in proj.get("dock", []):
        if d.get("name") == "vault":
            print(f'{d["id"]}\t{d.get("title","Docs & Files")}\t{d.get("url","")}')


def _create_attachment(cfg: dict, creds: dict, account_id: int, file_path: pathlib.Path) -> dict:
    token = _access_token(cfg, creds)
    base = _api_base(account_id)
    name = file_path.name
    url = f"{base}/attachments.json?{urllib.parse.urlencode({'name': name})}"
    body = file_path.read_bytes()
    return _http_json(
        "POST",
        url,
        access_token=token,
        user_agent=_user_agent(cfg, creds),
        raw_body=body,
        content_type="application/octet-stream",
        timeout_s=120,
    )


def _create_upload(
    cfg: dict,
    creds: dict,
    account_id: int,
    bucket_id: int,
    vault_id: int,
    *,
    attachable_sgid: str,
    base_name: str,
    description: str | None,
) -> dict:
    token = _access_token(cfg, creds)
    base = _api_base(account_id)
    payload = {"attachable_sgid": attachable_sgid, "base_name": base_name}
    if description:
        payload["description"] = description
    return _http_json(
        "POST",
        f"{base}/buckets/{bucket_id}/vaults/{vault_id}/uploads.json",
        access_token=token,
        user_agent=_user_agent(cfg, creds),
        data=payload,
        timeout_s=120,
    )


def cmd_push(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})

    auth = _authorization(cfg, creds)
    account_id = args.account_id or _account_id(cfg, creds, auth=auth)
    bucket_id = args.project_id or _bucket_id(cfg, creds)
    vault_id = args.vault_id or _vault_id(cfg, creds)
    if bucket_id is None:
        raise SystemExit("Missing project_id. Set basecamp.project_id in basecamp.toml or pass --project-id.")
    if vault_id is None:
        raise SystemExit("Missing vault_id. Set basecamp.vault_id in basecamp.toml or pass --vault-id.")

    src = pathlib.Path(args.path)
    if not src.is_absolute():
        src = (REPO_ROOT / src).resolve()
    if not src.exists():
        raise SystemExit(f"File not found: {src}")

    pdf_path = src
    if src.suffix == ".typ":
        if not args.build:
            raise SystemExit("Input is a .typ file. Re-run with --build to compile a PDF first.")
        pdf_path = src.with_suffix(".pdf")
        _typst_compile(src, pdf_path)
    elif src.suffix.lower() != ".pdf":
        raise SystemExit("Push currently supports .pdf or .typ (with --build).")

    commit = _git_rev()
    desc_parts = []
    if args.description:
        desc_parts.append(args.description.strip())
    if commit:
        desc_parts.append(f"Source commit: {commit}")
    desc_parts.append(f"Uploaded at: {_now_utc_iso()}")
    description = "\n".join(desc_parts).strip()

    attachment = _create_attachment(cfg, creds, account_id, pdf_path)
    upload = _create_upload(
        cfg,
        creds,
        account_id,
        bucket_id,
        vault_id,
        attachable_sgid=attachment["attachable_sgid"],
        base_name=pdf_path.stem,
        description=description,
    )

    _ensure_state_dir()
    sync = _load_json(SYNC_PATH, {})
    rel_key = str(pdf_path.relative_to(REPO_ROOT))
    sync[rel_key] = {
        "uploaded_at": _now_utc_iso(),
        "upload_id": upload.get("id"),
        "upload_url": upload.get("url"),
        "upload_app_url": upload.get("app_url"),
        "comments_url": upload.get("comments_url"),
        "comments_count": upload.get("comments_count", 0),
        "last_pulled_comment_id": sync.get(rel_key, {}).get("last_pulled_comment_id"),
        "last_pulled_at": sync.get(rel_key, {}).get("last_pulled_at"),
        "source_commit": commit,
        "pdf_path": rel_key,
    }
    _save_json(SYNC_PATH, sync)

    print("Uploaded:")
    if upload.get("app_url"):
        print(upload["app_url"])
    else:
        print(json.dumps(upload, indent=2, sort_keys=True))


def _recording_comments(cfg: dict, creds: dict, account_id: int, recording_id: int) -> list[dict]:
    token = _access_token(cfg, creds)
    base = _api_base(account_id)
    return _http_json(
        "GET",
        f"{base}/recordings/{recording_id}/comments.json",
        access_token=token,
        user_agent=_user_agent(cfg, creds),
    )


def _slug(s: str) -> str:
    s = s.lower()
    s = re.sub(r"[^a-z0-9]+", "-", s).strip("-")
    return s or "doc"


def _comment_to_md(c: dict) -> str:
    created = c.get("created_at", "")
    creator = (c.get("creator") or {}).get("name", "Unknown")
    raw = c.get("content", "")
    if "<" in raw and ">" in raw:
        parser = _HTMLToText()
        parser.feed(raw)
        text = parser.get_text()
    else:
        text = raw.strip()
    text = re.sub(r"\s+\n", "\n", text).strip()
    text = text.replace("\r\n", "\n")
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = text or "(empty)"
    return f"- {created} ({creator}): {text}\n"


def cmd_pull(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})

    auth = _authorization(cfg, creds)
    account_id = args.account_id or _account_id(cfg, creds, auth=auth)

    sync = _load_json(SYNC_PATH, {})
    if args.path:
        targets = [args.path]
    else:
        targets = list(sync.keys())

    if not targets:
        raise SystemExit("No sync targets found. Run push first, or pass a path.")

    feedback_dir = REPO_ROOT / "feedback" / "basecamp"
    feedback_dir.mkdir(parents=True, exist_ok=True)

    updated_any = False
    for t in targets:
        key = t
        if not pathlib.Path(key).is_absolute():
            key = str((REPO_ROOT / key).resolve().relative_to(REPO_ROOT))
        entry = sync.get(key)
        if not entry or not entry.get("upload_id"):
            print(f"Skipping (not pushed yet): {key}", file=sys.stderr)
            continue

        recording_id = int(entry["upload_id"])
        comments = _recording_comments(cfg, creds, account_id, recording_id) or []
        last_id = entry.get("last_pulled_comment_id")
        new = []
        for c in comments:
            cid = c.get("id")
            if last_id and cid and int(cid) <= int(last_id):
                continue
            new.append(c)

        if not new:
            continue

        title = pathlib.Path(key).stem
        md_path = feedback_dir / f"{_slug(title)}.md"
        if not md_path.exists():
            md_path.write_text(
                f"# Basecamp feedback: {title}\n\n"
                f"Basecamp URL: {entry.get('upload_app_url') or entry.get('upload_url') or ''}\n\n",
                encoding="utf-8",
            )

        stamp = dt.datetime.now().astimezone().strftime("%Y-%m-%d %H:%M %Z")
        with md_path.open("a", encoding="utf-8") as f:
            f.write(f"## Pulled {stamp}\n\n")
            for c in new:
                f.write(_comment_to_md(c))
            f.write("\n")

        max_id = max(int(c["id"]) for c in new if c.get("id"))
        entry["last_pulled_comment_id"] = max_id
        entry["last_pulled_at"] = _now_utc_iso()
        sync[key] = entry
        updated_any = True

    if updated_any:
        _ensure_state_dir()
        _save_json(SYNC_PATH, sync)
        print("Pulled new comments into feedback/basecamp/.")
    else:
        print("No new comments found.")


def cmd_oauth_url(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    client_id = args.client_id or creds.get("client_id") or _cfg_get(cfg, "oauth", "client_id", env="BASECAMP_CLIENT_ID")
    redirect_uri = (
        args.redirect_uri
        or creds.get("redirect_uri")
        or _cfg_get(cfg, "oauth", "redirect_uri", env="BASECAMP_REDIRECT_URI")
        or "http://127.0.0.1:8123/callback"
    )
    if not client_id:
        raise SystemExit("Missing client_id. Pass --client-id or set $BASECAMP_CLIENT_ID.")
    url = "https://launchpad.37signals.com/authorization/new"
    q = urllib.parse.urlencode({"type": "web_server", "client_id": client_id, "redirect_uri": redirect_uri})
    print(f"{url}?{q}")


def cmd_oauth_exchange(args) -> None:
    cfg = _load_toml(CONFIG_PATH)
    creds = _load_json(CREDS_PATH, {})
    client_id = args.client_id or creds.get("client_id") or _cfg_get(cfg, "oauth", "client_id", env="BASECAMP_CLIENT_ID")
    client_secret = (
        args.client_secret
        or creds.get("client_secret")
        or _cfg_get(cfg, "oauth", "client_secret", env="BASECAMP_CLIENT_SECRET")
    )
    redirect_uri = (
        args.redirect_uri
        or creds.get("redirect_uri")
        or _cfg_get(cfg, "oauth", "redirect_uri", env="BASECAMP_REDIRECT_URI")
        or "http://127.0.0.1:8123/callback"
    )
    if not client_id or not client_secret:
        raise SystemExit("Missing client_id/client_secret. Provide flags or set env vars.")
    token = _http_noauth_json(
        "POST",
        "https://launchpad.37signals.com/authorization/token",
        user_agent=_user_agent(cfg, creds),
        data={
            "type": "web_server",
            "client_id": client_id,
            "redirect_uri": redirect_uri,
            "client_secret": client_secret,
            "code": args.code,
        },
    )
    creds.update(
        {
            "client_id": client_id,
            "client_secret": client_secret,
            "redirect_uri": redirect_uri,
            "access_token": token.get("access_token"),
            "access_token_expires_at": token.get("expires_at"),
            "refresh_token": token.get("refresh_token"),
            "updated_at": _now_utc_iso(),
        }
    )
    _ensure_state_dir()
    _save_json(CREDS_PATH, creds)
    print(f"Wrote {CREDS_PATH}")


def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(prog="basecamp_cli.py")
    sub = p.add_subparsers(dest="cmd", required=True)

    oauth = sub.add_parser("oauth", help="OAuth helper commands")
    oauth_sub = oauth.add_subparsers(dest="oauth_cmd", required=True)

    oauth_url = oauth_sub.add_parser("url", help="Print the Basecamp authorization URL")
    oauth_url.add_argument("--client-id")
    oauth_url.add_argument("--redirect-uri")
    oauth_url.set_defaults(func=cmd_oauth_url)

    oauth_ex = oauth_sub.add_parser("exchange", help="Exchange an OAuth code for tokens and save them")
    oauth_ex.add_argument("--client-id")
    oauth_ex.add_argument("--client-secret")
    oauth_ex.add_argument("--redirect-uri")
    oauth_ex.add_argument("--code", required=True)
    oauth_ex.set_defaults(func=cmd_oauth_exchange)

    accounts = sub.add_parser("accounts", help="List accounts visible to the token")
    accounts.set_defaults(func=cmd_accounts)

    projects = sub.add_parser("projects", help="List projects for the account")
    projects.add_argument("--account-id", type=int)
    projects.add_argument("--query", help="Filter by substring in project name")
    projects.set_defaults(func=cmd_projects)

    project = sub.add_parser("project", help="Dump a project JSON (includes dock)")
    project.add_argument("project_id", type=int)
    project.add_argument("--account-id", type=int)
    project.set_defaults(func=cmd_project)

    vaults = sub.add_parser("vaults", help="Print Docs & Files vault IDs from a project dock")
    vaults.add_argument("project_id", type=int)
    vaults.add_argument("--account-id", type=int)
    vaults.set_defaults(func=cmd_vaults)

    push = sub.add_parser("push", help="Upload a PDF (or build a .typ) to Basecamp Docs & Files")
    push.add_argument("path", help="Path to .pdf or .typ")
    push.add_argument("--build", action="store_true", help="If input is .typ, compile it to PDF first")
    push.add_argument("--description", help="Optional description to include with the upload")
    push.add_argument("--account-id", type=int)
    push.add_argument("--project-id", type=int)
    push.add_argument("--vault-id", type=int)
    push.set_defaults(func=cmd_push)

    pull = sub.add_parser("pull", help="Pull new comments for pushed uploads into feedback/basecamp/")
    pull.add_argument("--path", help="Limit to a specific pushed file path")
    pull.add_argument("--account-id", type=int)
    pull.set_defaults(func=cmd_pull)

    return p


def main(argv: list[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    args.func(args)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
