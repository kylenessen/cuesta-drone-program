# Google Docs review workflow

This repo is set up so you can keep writing course material as plain Markdown here, push each course outline to Google Docs as a single comment-only review document, and pull reviewer comments back into the repo as Markdown. The repo stays the only source of truth. The Google Doc is a disposable review artifact: reviewers comment on it, the comments come back here, you edit the wiki, and the next push refreshes the same doc in place.

## What this supports

- Compile a course outline plus every wiki article it links into one review document, with the outline's links rewritten to jump to the full article text in an appendix.
- Push that document to Google Drive as a native Google Doc, shared so anyone with the link can comment but nobody can edit.
- Re-push after edits: the same doc is updated in place, so the link reviewers have keeps working and existing comments survive.
- Pull all comments and replies back into `feedback/gdocs/` as Markdown, with each comment attributed to the source wiki file it most likely refers to.

Comments carry the text the reviewer highlighted (Google's quoted content), which is what makes attribution back to source files work. Reviewers do not need to know or care that the doc was compiled from many files.

## One time setup

1. In the [Google Cloud Console](https://console.cloud.google.com/), create a project (any name), enable the **Google Drive API**, and configure the OAuth consent screen (External, add yourself as a test user).
2. Create an OAuth client ID of type **Desktop app**. Grab the client ID and client secret.
3. Copy `gdocs.toml.example` to `gdocs.toml` and fill in the IDs.
4. Install pandoc if you do not have it (`brew install pandoc`, or `pip install pypandoc-binary`).
5. Create local credentials:

   - Print the authorization URL:
     - `python3 scripts/gdocs_cli.py oauth url`
   - Visit the URL and approve. The browser will land on a `127.0.0.1` page that fails to load; that is expected. Copy the `code` query parameter out of the address bar.
   - Exchange the code for tokens:
     - `python3 scripts/gdocs_cli.py oauth exchange --code YOUR_CODE`

Tokens are written to `.gdocs/credentials.json` (gitignored). The OAuth scope is `drive.file`, which only grants access to files this tool itself creates, not the rest of your Drive.

## Push for review

Push one course:

- `python3 scripts/gdocs_cli.py push curriculum-content/course-outline-aero-110-mapping.md`

Push all courses listed in `gdocs.toml`:

- `python3 scripts/gdocs_cli.py push --all`

Push compiles automatically, so there is nothing to build first. On first push the doc is created and shared as anyone-with-the-link-can-comment (set `share = "none"` in `gdocs.toml` to keep it private, and add `reviewers = [...]` emails or use the `share` command instead). The command prints the doc link to send around. Subsequent pushes update the same doc in place; pass `--new` if you want a fresh doc with a new link instead.

The compiled document has three parts: a short note telling reviewers they only need to read the outline, the course outline itself with every topic linked into the appendix, and the appendix holding the full text of each linked wiki article. Cross-links between included articles work inside the doc; links to pages not included become plain text.

Mappings from outline path to Google Doc ID live in `.gdocs/sync.json`, and a snapshot of exactly what was pushed lives in `.gdocs/snapshots/` so comment attribution matches the doc reviewers actually saw, even if the wiki has moved on since.

## Pull feedback back into the repo

Pull comments for everything pushed:

- `python3 scripts/gdocs_cli.py pull`

Pull for one course:

- `python3 scripts/gdocs_cli.py pull --path curriculum-content/course-outline-aero-110-mapping.md`

Comments land in `feedback/gdocs/<course>.md`. The file is regenerated on every pull rather than appended, so it always reflects the live state of the doc, including reply threads and resolved status; git history preserves earlier states. Each comment includes the reviewer, the text they highlighted, and a best-effort `Source:` line pointing at the wiki file or outline that text came from, so incorporating feedback is a matter of opening that file.

Check where things stand at any time:

- `python3 scripts/gdocs_cli.py status`

## Add a reviewer later

- `python3 scripts/gdocs_cli.py share curriculum-content/course-outline-aero-110-mapping.md --email ron@example.edu --notify`

## The review loop

1. `push --all` and email the three doc links with a short preamble.
2. Reviewers comment. They cannot edit, so the text never diverges from the repo.
3. `pull`, read `feedback/gdocs/`, and incorporate what is worth incorporating into the wiki and outlines as normal commits.
4. Mark handled comments resolved in the Google Doc (or reply there), and `push` again so reviewers see the updated text at the same link.
5. When the review round is over, the docs can be deleted or left as an archive; the repo never depended on them.
