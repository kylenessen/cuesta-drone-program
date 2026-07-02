# Drone Knowledge Wiki

This directory is an LLM-maintained knowledge wiki following the Open Knowledge Format. It is maintained under the `llm-wiki` skill, which lives in the companion `skills` repository (`skills/llm-wiki/SKILL.md`).

Before writing or editing anything here:

1. Read `schema.md` in this directory. It defines this wiki's types, tags, fields, and folder layout, and its yaml registry is enforced by the linter.
2. Follow the llm-wiki skill's writing standards (titles, leads, links, citations, uncertainty).
3. Run `uv run scripts/lint.py .` from this directory before finishing, and fix errors.
4. Append an entry to `log.md` (newest first) describing what changed and why.

Sources in `sources/` are immutable evidence. Read them, never edit them.
