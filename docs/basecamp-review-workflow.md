# Basecamp review workflow

This repo is set up so you can write in Typst here, push a PDF to Basecamp for review, and pull Basecamp comments back into the repo as Markdown.

## What this supports

- Push a local `.pdf` to Basecamp Docs and Files.
- Push a local `.typ` by compiling it to a `.pdf` first.
- Pull Basecamp comments from that uploaded file into `feedback/basecamp/`.

This is a lightweight sync. Basecamp comments do not map cleanly to specific source lines in Typst, so the pull step records comments verbatim and relies on reviewers to include enough context to act on them.

## One time setup

1. Create a Basecamp integration and grab a `client_id` and `client_secret`.
2. Choose a redirect URL (suggested: `http://127.0.0.1:8123/callback`) and configure it in the Basecamp integration.
3. Copy `basecamp.toml.example` to `basecamp.toml` and fill in the IDs.
4. Create local credentials:

   - Print the authorization URL:
     - `python3 scripts/basecamp_cli.py oauth url --client-id YOUR_CLIENT_ID`
   - Visit the URL, approve, then copy the `code` query param from the redirect URL.
   - Exchange the code for tokens:
     - `python3 scripts/basecamp_cli.py oauth exchange --client-id YOUR_CLIENT_ID --client-secret YOUR_CLIENT_SECRET --code YOUR_CODE`

Tokens are written to `.basecamp/credentials.json` (gitignored).

## Finding the right Basecamp IDs

List accounts:

- `python3 scripts/basecamp_cli.py accounts`

List projects:

- `python3 scripts/basecamp_cli.py projects --account-id YOUR_ACCOUNT_ID --query "part of project name"`

Find the Docs and Files vault ID for a project:

- `python3 scripts/basecamp_cli.py vaults YOUR_PROJECT_ID --account-id YOUR_ACCOUNT_ID`

## Push for review

Push a PDF:

- `python3 scripts/basecamp_cli.py push research/certificate-specialization-proposal.pdf`

Build from Typst and push:

- `python3 scripts/basecamp_cli.py push --build research/certificate-specialization-proposal.typ`

The script stores a mapping in `.basecamp/sync.json` so later pulls know which Basecamp upload to read comments from.

## Pull feedback back into the repo

Pull for everything you have pushed:

- `python3 scripts/basecamp_cli.py pull`

Pull for a specific document:

- `python3 scripts/basecamp_cli.py pull --path research/certificate-specialization-proposal.pdf`

New comments append into `feedback/basecamp/<doc>.md`.

## Reviewer guidance

To make feedback actionable when it comes back into this repo, ask reviewers to start comments with one of these:

- A section heading from the document
- A page number (example: `p3`)
- A short quote from the relevant paragraph

That context survives the round trip and makes it easy to update the Typst source.

