# Drone Knowledge Wiki

This directory is an LLM-maintained knowledge wiki for the drone curriculum.

Before writing or editing anything here:

1. Read `schema.md` in this directory. It defines the wiki's purpose, page families, and folder layout.
2. Keep titles, leads, links, citations, and uncertainty clear.
3. Append an entry to `log.md` (newest first) describing what changed and why.

Links use **relative markdown paths**, not the OKF bundle-absolute style (a leading `/`). Write `[Part 107](../regulations/part-107.md)` from another folder, or `[Night Operations](night-operations.md)` within the same folder. This lets links resolve in Obsidian whether the vault opened is the whole repo or just this `wiki/` folder, and it keeps them working on GitHub. Do not reintroduce leading-slash links even though the general wiki skill describes them.

Sources in `sources/` are immutable evidence. Read them, never edit them.
