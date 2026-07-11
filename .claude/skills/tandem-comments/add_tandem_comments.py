#!/usr/bin/env python3
"""Append or merge obsidian-tandem-comments blocks into Markdown files.

Usage:
    python3 add_tandem_comments.py spec.json

spec.json maps a file path to a list of comment specs:

    {
      "wiki/topics/notams.md": [
        {
          "id": "notam-timeline",
          "exact": "by spring 2026",
          "text": "Recheck once the FAA confirms the transition is complete.",
          "prefix": "",          // optional
          "suffix": "",          // optional
          "author": "Claude",    // optional, default Claude
          "ts": "2026-07-11T00:00:00Z",  // optional, default today 00:00:00Z
          "status": "open"       // optional, default open
        }
      ]
    }

Guarantees: every `exact` anchor must occur exactly once in its file, or the
script writes nothing and exits non-zero. If a file already ends with a
tandem-comments block, new comments are merged into it (ids must not collide).
The prose is never modified.
"""
import json
import re
import sys

BLOCK_RE = re.compile(r"\n?```tandem-comments\n(.*?)\n```\n?\Z", re.S)


def default_ts():
    # Wall-clock time is not reliably available; anchor to a date the caller can
    # override. Falls back to a fixed placeholder so runs are reproducible.
    return "1970-01-01T00:00:00Z"


def main(spec_path):
    with open(spec_path) as f:
        spec = json.load(f)

    errors = []
    plans = []

    for path, comments in spec.items():
        try:
            text = open(path).read()
        except OSError as e:
            errors.append(f"{path}: cannot read ({e})")
            continue

        existing = {}
        m = BLOCK_RE.search(text)
        body = text
        if m:
            try:
                existing = json.loads(m.group(1))
            except json.JSONDecodeError as e:
                errors.append(f"{path}: existing tandem-comments block is not valid JSON ({e})")
                continue
            body = text[: m.start()]

        # The anchor must match against the prose, not any comment block.
        prose = body

        obj = dict(existing)
        for c in comments:
            cid = c["id"]
            exact = c["exact"]
            if cid in obj:
                errors.append(f"{path}: comment id {cid!r} already exists")
                continue
            n = prose.count(exact)
            if n != 1:
                errors.append(f"{path}: anchor for {cid!r} occurs {n}x (need exactly 1): {exact[:60]!r}")
                continue
            anchor = {"exact": exact}
            if c.get("prefix"):
                anchor["prefix"] = c["prefix"]
            if c.get("suffix"):
                anchor["suffix"] = c["suffix"]
            obj[cid] = {
                "anchor": anchor,
                "status": c.get("status", "open"),
                "thread": [
                    {
                        "author": c.get("author", "Claude"),
                        "ts": c.get("ts", default_ts()),
                        "text": c["text"],
                    }
                ],
            }

        block = "\n```tandem-comments\n" + json.dumps(obj, indent=2, ensure_ascii=False) + "\n```\n"
        new_body = body if body.endswith("\n") else body + "\n"
        plans.append((path, new_body + block, len(comments)))

    if errors:
        print("Refusing to write. Fix these first:", file=sys.stderr)
        for e in errors:
            print("  - " + e, file=sys.stderr)
        return 1

    for path, content, n in plans:
        with open(path, "w") as f:
            f.write(content)
        print(f"OK {path}: {n} comment(s)")
    return 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(2)
    sys.exit(main(sys.argv[1]))
