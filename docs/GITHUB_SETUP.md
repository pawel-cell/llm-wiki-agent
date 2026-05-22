# GitHub Setup Guide

This guide shows how to set up the LLM Wiki Agent as a GitHub repo.

## Option A — Use the existing repo

If you just want to use the ready-made version:

```bash
git clone https://github.com/pawel-cell/llm-wiki-agent.git
cd llm-wiki-agent
bash scripts/install.sh
```

On Windows PowerShell:

```powershell
git clone https://github.com/pawel-cell/llm-wiki-agent.git
cd llm-wiki-agent
powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

## Option B — Create your own GitHub repo from scratch

### 1. Create a new repo on GitHub

1. Go to [https://github.com/new](https://github.com/new)
2. Repository name: `my-llm-wiki`
3. Choose `Public` or `Private`
4. Do **not** add a README if you already have local files
5. Click **Create repository**

GitHub will show you a remote URL like:

```text
https://github.com/YOUR-USERNAME/my-llm-wiki.git
```

### 2. Create the local folder

Mac / Linux:

```bash
mkdir -p my-llm-wiki/sources my-llm-wiki/wiki
cd my-llm-wiki
touch AGENTS.md README.md wiki/index.md sources/.gitkeep
```

Windows PowerShell:

```powershell
mkdir my-llm-wiki
cd my-llm-wiki
mkdir sources
mkdir wiki
New-Item AGENTS.md
New-Item README.md
New-Item wiki/index.md
New-Item sources/.gitkeep
```

### 3. Add the agent instructions

Copy the contents of this repo's `AGENTS.md` into your own `AGENTS.md` file.

The important rule is:

```text
sources/ = raw source files, read-only
wiki/    = generated Markdown pages
```

### 4. Commit the files

```bash
git init
git add .
git commit -m "Initial LLM Wiki Agent setup"
git branch -M main
```

### 5. Connect to GitHub

Replace `YOUR-USERNAME` and `my-llm-wiki` with your real GitHub username and repo name:

```bash
git remote add origin https://github.com/YOUR-USERNAME/my-llm-wiki.git
git push -u origin main
```

## Option C — Fork this repo

If you want to start from this exact repo:

1. Open [https://github.com/pawel-cell/llm-wiki-agent](https://github.com/pawel-cell/llm-wiki-agent)
2. Click **Fork**
3. Choose your GitHub account
4. Clone your fork:

```bash
git clone https://github.com/YOUR-USERNAME/llm-wiki-agent.git
cd llm-wiki-agent
```

## How to use it after GitHub setup

1. Put raw material into `sources/`
2. Commit and push it:

```bash
git add sources
git commit -m "Add source material"
git push
```

3. Open the repo locally with your coding agent.
4. Tell it:

```text
Read AGENTS.md. Ingest all files in /sources and update /wiki.
```

5. Review the generated `wiki/` pages.
6. Commit the wiki update:

```bash
git add wiki
git commit -m "Update wiki from sources"
git push
```

## Recommended GitHub settings

For a simple personal wiki repo:

- Private repo if source files are sensitive.
- Public repo if it is meant to be shared.
- Keep GitHub Issues enabled if you want to track open questions.
- Keep GitHub Wiki disabled because this repo already has its own `/wiki` folder.

## If source files are private

Do not upload private PDFs, client files, transcripts, or research to a public repo.

Use one of these instead:

- Make the GitHub repo private.
- Keep `sources/` local only and only push `wiki/`.
- Store sensitive files in Google Drive/Dropbox and add only safe summaries to GitHub.

## Common problems

### Git says: `remote origin already exists`

Run:

```bash
git remote -v
git remote remove origin
git remote add origin https://github.com/YOUR-USERNAME/my-llm-wiki.git
```

### Git asks for username/password

Use a GitHub Personal Access Token as the password, or set up GitHub Desktop / GitHub CLI.

### Empty folders do not appear on GitHub

Git does not track empty folders. Add a `.gitkeep` file inside the folder:

```bash
touch sources/.gitkeep wiki/.gitkeep
```

### Agent cannot read PDFs

Convert the PDF to `.txt` or `.md`, then put the converted file into `sources/`.
