#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = ["pyyaml"]
# ///
"""Lint an llm-wiki bundle.

Reads the wiki's schema.md registry (the fenced yaml block containing a
`types` mapping) and enforces OKF conformance plus the llm-wiki skill's
conventions: frontmatter requirements, type and tag vocabulary, filename
style, H1-and-lead layout, link resolution and style, citation structure,
orphan detection, and reserved-file rules.

Usage:
    uv run lint.py [WIKI_ROOT] [--strict]

Exit codes: 0 clean (or warnings only), 1 errors (or warnings with --strict),
2 could not lint (missing root or unusable schema.md).
"""

from __future__ import annotations

import argparse
import datetime as dt
import re
import sys
import urllib.parse
from dataclasses import dataclass, field
from pathlib import Path

import yaml

RESERVED = {"index.md", "log.md"}
DEFAULT_EXCLUDE = {".git", ".obsidian", ".claude", ".codex", "node_modules"}

KEBAB_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*(\.[a-z0-9]+)?$")
UNDERSCORE_RE = re.compile(r"^[A-Za-z0-9]+(_[A-Za-z0-9]+)*(\.[A-Za-z0-9]+)?$")
TAG_RE = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
MD_LINK_RE = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
WIKILINK_RE = re.compile(r"\[\[[^\]]+\]\]")
EXTERNAL_RE = re.compile(r"^[a-zA-Z][a-zA-Z0-9+.-]*:")
CITE_MARKER_RE = re.compile(r"(?<![\w\]])\[(\d{1,3})\]")
DATE_HEADING_RE = re.compile(r"^#{1,3}\s+(\d{4}-\d{2}-\d{2})\s*$")
FENCE_RE = re.compile(r"^(```|~~~)")
YAML_BLOCK_RE = re.compile(r"^```ya?ml\s*$(.*?)^```\s*$", re.MULTILINE | re.DOTALL)


@dataclass
class Finding:
    level: str  # "error" | "warning"
    path: str
    line: int | None
    message: str

    def sort_key(self):
        return (self.path, self.line or 0, self.level, self.message)


@dataclass
class Schema:
    types: dict = field(default_factory=dict)
    tags: dict = field(default_factory=dict)
    fields: dict = field(default_factory=dict)
    exclude: set = field(default_factory=set)
    sources_folder: str | None = None
    filename_style: str = "kebab-case"
    link_style: str = "bundle-absolute"
    require_description: bool = True


@dataclass
class Page:
    rel: str
    frontmatter: dict | None
    body_start: int  # 0-based line index where body begins
    lines: list[str]
    stripped: list[str]  # lines with code fences/spans blanked, same numbering


def parse_frontmatter(lines: list[str]) -> tuple[dict | None, int, str | None]:
    """Return (frontmatter, body_start_index, error). No frontmatter -> (None, 0, None)."""
    if not lines or lines[0].strip() != "---":
        return None, 0, None
    for i in range(1, len(lines)):
        if lines[i].strip() == "---":
            raw = "\n".join(lines[1:i])
            try:
                data = yaml.safe_load(raw)
            except yaml.YAMLError as exc:
                return None, i + 1, f"frontmatter is not parseable YAML ({exc})"
            if data is None:
                data = {}
            if not isinstance(data, dict):
                return None, i + 1, "frontmatter must be a YAML mapping"
            return data, i + 1, None
    return None, 0, "frontmatter opening '---' is never closed"


def strip_code(lines: list[str]) -> list[str]:
    """Blank out fenced code blocks and inline code spans, preserving line count."""
    out = []
    in_fence = False
    for line in lines:
        if FENCE_RE.match(line.strip()):
            in_fence = not in_fence
            out.append("")
            continue
        if in_fence:
            out.append("")
        else:
            out.append(re.sub(r"`[^`]*`", "", line))
    return out


def load_schema(root: Path, findings: list[Finding]) -> Schema | None:
    schema_path = root / "schema.md"
    if not schema_path.exists():
        findings.append(Finding("error", "schema.md", None,
                                "no schema.md at the bundle root; this wiki has no registry to lint against "
                                "(see the llm-wiki skill's references/schema-template.md)"))
        return None
    text = schema_path.read_text(encoding="utf-8")
    registry = None
    for match in YAML_BLOCK_RE.finditer(text):
        try:
            data = yaml.safe_load(match.group(1))
        except yaml.YAMLError:
            continue
        if isinstance(data, dict) and "types" in data:
            if registry is not None:
                findings.append(Finding("error", "schema.md", None,
                                        "multiple yaml blocks contain a 'types' key; the registry must be exactly one block"))
                return None
            registry = data
    if registry is None:
        findings.append(Finding("error", "schema.md", None,
                                "no fenced yaml block with a 'types' mapping found; the linter needs the registry"))
        return None

    schema = Schema()
    types = registry.get("types") or {}
    if not isinstance(types, dict):
        findings.append(Finding("error", "schema.md", None, "'types' must be a mapping of type name to definition"))
        return None
    for name, spec in types.items():
        schema.types[str(name)] = spec if isinstance(spec, dict) else {}

    raw_tags = registry.get("tags") or {}
    if isinstance(raw_tags, dict):
        schema.tags = {str(k): str(v) for k, v in raw_tags.items()}
    elif isinstance(raw_tags, list):
        schema.tags = {str(t): "" for t in raw_tags}
    else:
        findings.append(Finding("error", "schema.md", None, "'tags' must be a mapping or a list"))

    raw_fields = registry.get("fields") or {}
    if isinstance(raw_fields, dict):
        for fname, vocab in raw_fields.items():
            if isinstance(vocab, list):
                schema.fields[str(fname)] = [str(v) for v in vocab]

    opts = registry.get("options") or {}
    if isinstance(opts, dict):
        schema.exclude = {str(e).strip("/") for e in opts.get("exclude", []) or []}
        schema.sources_folder = opts.get("sources_folder")
        schema.filename_style = opts.get("filename_style", "kebab-case")
        schema.link_style = opts.get("link_style", "bundle-absolute")
        schema.require_description = bool(opts.get("require_description", True))

    for tag in schema.tags:
        if not TAG_RE.match(tag):
            findings.append(Finding("error", "schema.md", None,
                                    f"registered tag '{tag}' is not lowercase kebab-case"))
    return schema


def is_excluded(rel: Path, schema: Schema) -> bool:
    parts = rel.parts
    if any(p.startswith(".") and p not in (".",) for p in parts[:-1]):
        return True
    if parts and parts[0] in DEFAULT_EXCLUDE:
        return True
    rel_str = "/".join(parts)
    for ex in schema.exclude:
        if rel_str == ex or rel_str.startswith(ex + "/"):
            return True
    return False


def check_filename(rel: Path, schema: Schema, findings: list[Finding]) -> None:
    style = schema.filename_style
    if style == "any":
        return
    pattern = KEBAB_RE if style == "kebab-case" else UNDERSCORE_RE
    if not pattern.match(rel.name):
        findings.append(Finding("error", str(rel), None,
                                f"filename is not {style} (expected e.g. "
                                f"'{'my-article.md' if style == 'kebab-case' else 'My_Article.md'}')"))


def check_frontmatter(page: Page, schema: Schema, findings: list[Finding]) -> None:
    fm = page.frontmatter
    rel = page.rel
    if fm is None:
        findings.append(Finding("error", rel, 1, "missing YAML frontmatter (OKF requires it on every concept page)"))
        return

    ptype = fm.get("type")
    is_schema_doc = rel == "schema.md"
    if not ptype or not str(ptype).strip():
        findings.append(Finding("error", rel, 1, "frontmatter 'type' is missing or empty (OKF's one hard requirement)"))
    elif not is_schema_doc and str(ptype) not in schema.types:
        known = ", ".join(sorted(schema.types)) or "(none registered)"
        findings.append(Finding("error", rel, 1,
                                f"type '{ptype}' is not in the schema.md registry (known types: {known}); "
                                f"register it in schema.md first if it is genuinely new"))
    else:
        spec = schema.types.get(str(ptype), {})
        folder = spec.get("folder")
        if folder and not is_schema_doc and not rel.startswith(str(folder).strip("/") + "/"):
            findings.append(Finding("error", rel, None,
                                    f"pages of type '{ptype}' belong under '{folder}/' per the schema registry"))
        for req in spec.get("required", []) or []:
            if req not in fm or fm.get(req) in (None, "", []):
                findings.append(Finding("error", rel, 1,
                                        f"type '{ptype}' requires frontmatter field '{req}' per the schema registry"))

    if not str(fm.get("title") or "").strip():
        findings.append(Finding("error", rel, 1, "frontmatter 'title' is missing or empty"))
    desc_level = "error" if schema.require_description else "warning"
    if not str(fm.get("description") or "").strip():
        findings.append(Finding(desc_level, rel, 1, "frontmatter 'description' is missing or empty"))

    tags = fm.get("tags")
    if tags is not None:
        if not isinstance(tags, list):
            findings.append(Finding("error", rel, 1, "'tags' must be a YAML list"))
        else:
            for tag in tags:
                tag = str(tag)
                if not TAG_RE.match(tag):
                    findings.append(Finding("error", rel, 1, f"tag '{tag}' is not lowercase kebab-case"))
                elif tag not in schema.tags:
                    findings.append(Finding("error", rel, 1,
                                            f"tag '{tag}' is not registered in schema.md; register it first"))

    for fname, vocab in schema.fields.items():
        if fname in fm and fm[fname] is not None:
            value = fm[fname]
            if isinstance(value, (dt.date, dt.datetime)):
                value = value.isoformat()
            if str(value) not in vocab:
                findings.append(Finding("error", rel, 1,
                                        f"'{fname}: {value}' is not in the schema vocabulary {vocab}"))

    ts = fm.get("timestamp")
    if ts is not None and not isinstance(ts, (dt.date, dt.datetime)):
        try:
            dt.datetime.fromisoformat(str(ts).replace("Z", "+00:00"))
        except ValueError:
            findings.append(Finding("warning", rel, 1, f"timestamp '{ts}' is not ISO 8601"))


def check_layout(page: Page, findings: list[Finding]) -> None:
    """H1 title first, matching frontmatter title, lead paragraph, no other H1s."""
    rel = page.rel
    title = str((page.frontmatter or {}).get("title") or "").strip()
    body = page.lines[page.body_start:]
    offset = page.body_start

    first_content = None
    for i, line in enumerate(body):
        if line.strip():
            first_content = (i, line)
            break
    if first_content is None:
        findings.append(Finding("error", rel, offset + 1, "page has no body"))
        return

    i, line = first_content
    if not line.startswith("# "):
        findings.append(Finding("error", rel, offset + i + 1,
                                "first body line must be the H1 title ('# Title')"))
        h1_index = None
    else:
        h1_text = line[2:].strip()
        if title and h1_text != title:
            findings.append(Finding("error", rel, offset + i + 1,
                                    f"H1 '{h1_text}' does not match frontmatter title '{title}'"))
        h1_index = i

    stripped_body = page.stripped[page.body_start:]
    for j, sline in enumerate(stripped_body):
        if sline.startswith("# ") and j != (h1_index if h1_index is not None else -1):
            findings.append(Finding("error", rel, offset + j + 1,
                                    "extra H1 in body; the H1 is reserved for the title, use '##' for sections"))

    if h1_index is not None:
        lead_found = False
        for line2 in body[h1_index + 1:]:
            if line2.startswith("#"):
                break
            if line2.strip():
                lead_found = True
                break
        if not lead_found:
            findings.append(Finding("error", rel, offset + h1_index + 1,
                                    "no lead paragraph between the H1 and the first section heading"))


def check_links(page: Page, root: Path, schema: Schema,
                findings: list[Finding], link_graph: dict[str, set[str]]) -> None:
    rel = page.rel
    src_dir = (root / rel).parent
    outbound = link_graph.setdefault(rel, set())

    for lineno, line in enumerate(page.stripped, start=1):
        if WIKILINK_RE.search(line):
            findings.append(Finding("error", rel, lineno,
                                    "wikilink found; use bundle-absolute markdown links like [Title](/folder/page.md)"))
        for m in MD_LINK_RE.finditer(line):
            target = m.group(1).strip()
            if target.startswith("<") and target.endswith(">"):
                target = target[1:-1].strip()
            else:
                target = target.split(" ")[0]
            if not target or target.startswith("#") or EXTERNAL_RE.match(target):
                continue
            target = target.split("#")[0]
            if not target:
                continue
            target = urllib.parse.unquote(target)
            if target.startswith("/"):
                resolved = (root / target.lstrip("/")).resolve()
            else:
                resolved = (src_dir / target).resolve()
                if schema.link_style == "bundle-absolute":
                    findings.append(Finding("warning", rel, lineno,
                                            f"relative link '{target}'; this wiki uses bundle-absolute links (start with '/')"))
            try:
                target_rel = resolved.relative_to(root.resolve())
            except ValueError:
                findings.append(Finding("error", rel, lineno, f"link '{target}' escapes the bundle root"))
                continue
            if not resolved.exists():
                findings.append(Finding("error", rel, lineno, f"broken link '{target}'"))
                continue
            if resolved.suffix == ".md":
                outbound.add(str(target_rel))


def check_citations(page: Page, findings: list[Finding]) -> None:
    rel = page.rel
    heading_line = None
    for i, line in enumerate(page.stripped):
        if re.match(r"^##\s+Citations\s*$", line):
            heading_line = i
            break

    used: set[str] = set()
    end = heading_line if heading_line is not None else len(page.stripped)
    for line in page.stripped[page.body_start:end]:
        for m in CITE_MARKER_RE.finditer(line):
            used.add(m.group(1))

    defined: set[str] = set()
    if heading_line is not None:
        for line in page.stripped[heading_line + 1:]:
            if line.startswith("#"):
                break
            m = re.match(r"^(?:[-*+]\s+)?\[(\d{1,3})\]", line.strip())
            if m:
                defined.add(m.group(1))

    if used and heading_line is None:
        findings.append(Finding("error", rel, None,
                                f"citation markers {sorted(used)} used but there is no '## Citations' section"))
    elif used - defined:
        findings.append(Finding("error", rel, heading_line + 1 if heading_line is not None else None,
                                f"citation markers {sorted(used - defined)} have no entry in '## Citations'"))
    if defined - used:
        findings.append(Finding("warning", rel, heading_line + 1,
                                f"citation entries {sorted(defined - used)} are never referenced in the body"))


def check_reserved(page: Page, root: Path, findings: list[Finding]) -> None:
    rel = page.rel
    name = Path(rel).name
    if name == "index.md":
        if page.frontmatter is not None:
            allowed = rel == "index.md" and set(page.frontmatter) <= {"okf_version"}
            if not allowed:
                findings.append(Finding("error", rel, 1,
                                        "index.md is reserved and must not carry frontmatter "
                                        "(the bundle-root index may carry only 'okf_version')"))
    elif name == "log.md":
        if page.frontmatter is not None:
            findings.append(Finding("error", rel, 1, "log.md is reserved and must not carry frontmatter"))
        dates = []
        for lineno, line in enumerate(page.stripped, start=1):
            m = DATE_HEADING_RE.match(line)
            if m:
                dates.append((lineno, m.group(1)))
        for (l1, d1), (l2, d2) in zip(dates, dates[1:]):
            if d2 > d1:
                findings.append(Finding("warning", rel, l2,
                                        f"log dates out of order ({d2} after {d1}); log.md is newest-first"))
                break


def lint(root: Path, strict: bool) -> int:
    findings: list[Finding] = []
    schema = load_schema(root, findings)
    if schema is None:
        for f in findings:
            print(f"ERROR  {f.path}: {f.message}")
        return 2

    pages: list[Page] = []
    for path in sorted(root.rglob("*.md")):
        rel = path.relative_to(root)
        if is_excluded(rel, schema):
            continue
        lines = path.read_text(encoding="utf-8").splitlines()
        fm, body_start, err = parse_frontmatter(lines)
        if err:
            findings.append(Finding("error", str(rel), 1, err))
        pages.append(Page(str(rel), fm, body_start, lines, strip_code(lines)))

    link_graph: dict[str, set[str]] = {}
    for page in pages:
        name = Path(page.rel).name
        if name in RESERVED:
            check_reserved(page, root, findings)
            check_links(page, root, schema, findings, link_graph)
            continue
        check_filename(Path(page.rel), schema, findings)
        check_frontmatter(page, schema, findings)
        if page.frontmatter is not None:
            check_layout(page, findings)
        check_links(page, root, schema, findings, link_graph)
        check_citations(page, findings)

    # Orphan and dead-end analysis over concept pages.
    inbound: set[str] = set()
    for targets in link_graph.values():
        inbound |= targets
    for page in pages:
        name = Path(page.rel).name
        if name in RESERVED or page.rel == "schema.md":
            continue
        if page.rel not in inbound:
            findings.append(Finding("warning", page.rel, None,
                                    "orphan page: nothing links here; add a link from an index or related article"))
        if not link_graph.get(page.rel):
            findings.append(Finding("warning", page.rel, None,
                                    "dead-end page: no outbound links to other pages"))

    findings.sort(key=Finding.sort_key)
    errors = sum(1 for f in findings if f.level == "error")
    warnings = sum(1 for f in findings if f.level == "warning")
    for f in findings:
        loc = f"{f.path}:{f.line}" if f.line else f.path
        print(f"{'ERROR ' if f.level == 'error' else 'WARN  '} {loc}: {f.message}")
    print(f"\n{len(pages)} pages checked: {errors} error(s), {warnings} warning(s)")
    if errors or (strict and warnings):
        return 1
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description="Lint an llm-wiki bundle against its schema.md registry.")
    parser.add_argument("root", nargs="?", default=".", help="wiki bundle root (default: current directory)")
    parser.add_argument("--strict", action="store_true", help="treat warnings as errors")
    args = parser.parse_args()
    root = Path(args.root).resolve()
    if not root.is_dir():
        print(f"ERROR  {root} is not a directory")
        return 2
    return lint(root, args.strict)


if __name__ == "__main__":
    sys.exit(main())
