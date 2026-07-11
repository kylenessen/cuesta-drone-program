---
name: tandem-comments
description: Leave review comments, annotations, questions, or flags inside Markdown files for review in Obsidian with the obsidian-tandem-comments plugin. Use whenever the user asks to "leave comments", "add review notes", "flag things for my eye", "annotate", or "add tandem-comments" on notes they review in Obsidian. Writes anchored comment threads without altering the prose.
---

# Tandem Comments

The [obsidian-tandem-comments](https://github.com/leonpawelzik/obsidian-tandem-comments)
plugin stores comments in a fenced code block at the end of a Markdown file, anchored to
quoted spans of the prose. The plugin renders each comment attached to its highlighted text
and lets the reviewer reply or resolve it in Obsidian. This repository is reviewed in
Obsidian with the whole repo opened as the vault, so this is the way to leave feedback.

## The format

One fenced block per file, appended at the very end, language `tandem-comments`, holding a
JSON object that maps a short comment id to a comment record:

````markdown
```tandem-comments
{
  "a1f3": {
    "anchor": { "exact": "cut prices hard", "prefix": "We should ", "suffix": " in Q3" },
    "status": "open",
    "thread": [
      { "author": "Claude", "ts": "2026-07-11T00:00:00Z", "text": "Too aggressive?" }
    ]
  }
}
```
````

- `anchor` is a W3C TextQuoteSelector. `exact` is the quoted span (required). `prefix` and
  `suffix` are the surrounding text for disambiguation (optional). `pos` (character offset)
  is an optional tie-breaker.
- `status` is `open` or `resolved`.
- `thread` is an array of `{ author, ts, text }`. `ts` is ISO 8601 UTC.

## Rules

1. **Never touch the prose.** The comment lives only in the trailing block. If you find
   yourself editing a sentence to make an anchor fit, stop and pick a different anchor.
2. **The `exact` anchor must appear in the file exactly once.** If the span you want to
   anchor repeats, extend `exact` until it is unique, or add `prefix`/`suffix`. The helper
   script below refuses to write an anchor that is missing or ambiguous, so use it.
3. **One block per file.** If a file already ends with a `tandem-comments` block, merge new
   comments into its JSON object rather than appending a second block. The helper does this.
4. **Author and timestamp.** Author your comments `Claude` so they are distinguishable from
   the user's. Use an ISO 8601 UTC timestamp; since wall-clock time is not reliably available,
   `YYYY-MM-DDT00:00:00Z` for the current date is fine and honest.
5. **Comment content is for a decision, not narration.** Each comment should flag a choice
   the user must make, a claim to verify, or an open question, with enough context to act on
   without scrolling. Do not restate what the prose already says.
6. **Caveat for the user:** the plugin re-anchors by matching `exact`, so a comment detaches
   if its anchored text is later edited. Anchor to stable spans.

## How to write them

Use the bundled helper, which verifies every anchor is unique before writing and merges into
any existing block:

```bash
python3 .claude/skills/tandem-comments/add_tandem_comments.py spec.json
```

where `spec.json` is:

```json
{
  "path/to/note.md": [
    { "id": "cap-cat", "exact": "cap of 15 falls below the range", "text": "Confirm cap or category with the curriculum office." }
  ]
}
```

Optional per-comment fields: `prefix`, `suffix`, `author` (default `Claude`), `ts` (default
today at 00:00:00Z), `status` (default `open`). The script prints a clear error and writes
nothing if any `exact` is missing or appears more than once in its file.

For a one-off comment you can also write the block by hand following the format above, but run
a quick check that `exact` occurs exactly once in the target file first.
