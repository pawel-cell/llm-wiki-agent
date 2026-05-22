# LLM Wiki Agent

A simple GitHub-ready Markdown wiki workspace for turning raw source files into clean wiki pages with any coding agent: Claude Code, Codex, Cursor, OpenCode, Hermes, or another agent that can read and write files.

The idea is very simple:

```text
raw source files -> AI agent reads instructions -> generated Markdown wiki
```

## What this repo is for

Use this when you want an LLM to build and maintain a small personal or team knowledge base from:

- PDFs
- meeting notes
- transcripts
- articles
- exported docs
- research notes
- Markdown files

The agent keeps raw material in `sources/` and writes structured pages in `wiki/`.

## Files in this repo

```text
llm-wiki-agent/
  AGENTS.md              # Main instruction file for coding agents
  agent.md               # Same instructions, lower-case copy for tools/people who expect this name
  README.md              # Full setup guide
  sources/               # Put raw material here
  wiki/                  # Agent writes wiki pages here
  scripts/
    install.sh           # Mac / Linux setup helper
    install.ps1          # Windows PowerShell setup helper
  docs/
    GITHUB_SETUP.md      # Step-by-step GitHub setup guide
```

## 1. Create the folder

Create a normal project folder somewhere your coding agent can access.

Good place:

```text
~/Projects/my-llm-wiki/
```

Or inside an existing project:

```text
my-existing-project/
  llm-wiki/
```

Best starting option: make it its own folder or Git repo.

### Mac / Linux

```bash
mkdir -p my-llm-wiki/sources my-llm-wiki/wiki
cd my-llm-wiki
touch AGENTS.md
```

### Windows PowerShell

```powershell
mkdir my-llm-wiki
cd my-llm-wiki
mkdir sources
mkdir wiki
New-Item AGENTS.md
```

You should now have:

```text
my-llm-wiki/
  sources/
  wiki/
  AGENTS.md
```

## 2. Or install this ready-made repo

If you want the ready-made version, clone this repo:

```bash
git clone https://github.com/pawel-cell/llm-wiki-agent.git
cd llm-wiki-agent
```

Then run the setup helper.

### Mac / Linux

```bash
bash scripts/install.sh
```

### Windows PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

The install scripts only make sure the folders and starter files exist. They do not install heavy dependencies.

## 3. Put raw material in `sources/`

Put your PDFs, notes, meeting transcripts, articles, exported docs, or Markdown files here.

Example:

```text
my-llm-wiki/
  sources/
    article-1.pdf
    meeting-notes.md
    research-paper.pdf
  wiki/
  AGENTS.md
```

Treat `sources/` as read-only source material.

## 4. Open the folder with your agent

Open the repo/folder in a coding agent such as:

- Claude Code
- Codex
- Cursor
- OpenCode
- Hermes Agent
- any other agent that can read and write files

Then say:

```text
Read AGENTS.md. Ingest all files in /sources and update /wiki.
```

## 5. Use these simple commands

### Ingest new files

```text
Ingest all files in /sources and update /wiki according to AGENTS.md.
```

### Ask a question

```text
Answer this using /wiki first. If the wiki is incomplete, update it from /sources, then answer:

[QUESTION]
```

### Clean up the wiki

```text
Lint the wiki. Find duplicates, contradictions, missing source references, and pages that should be merged.
```

## 6. Commands you may give your agent

### Ingest

When you say `ingest sources`, the agent should update the wiki from `sources/`.

### Ask

When you ask a question, the agent should answer from `wiki/` first, then check `sources/` if needed.

### Clean up

When you say `lint wiki`, the agent should find duplicates, stale pages, missing links, and contradictions.

## 7. Basic workflow

```text
Create folder
→ Add files to /sources
→ Agent reads AGENTS.md
→ Agent writes structured pages in /wiki
→ You ask questions against the wiki
→ Agent keeps improving it
```

That is the simplest Karpathy-style LLM Wiki setup: **a folder, raw sources, generated Markdown pages, and one agent instruction file.**

## 8. GitHub setup

If you want to create your own GitHub repo from this template, read:

[`docs/GITHUB_SETUP.md`](docs/GITHUB_SETUP.md)

Short version:

```bash
git init
git add .
git commit -m "Initial LLM Wiki Agent setup"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git
git push -u origin main
```

## 9. Important note about PDFs

Some agents can read PDFs directly. Some cannot.

If your agent struggles with PDFs, convert the PDF to text or Markdown first, then put the converted file in `sources/`.

Good fallback formats:

- `.md`
- `.txt`
- `.docx` exported as Markdown/text

## 10. Safety rule

Never ask the agent to rewrite or delete `sources/` unless you really mean it.

The normal rule is:

```text
sources/ = raw material, read-only
wiki/    = generated pages, safe to edit
```
