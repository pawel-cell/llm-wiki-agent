# LLM Wiki Agent

You maintain a simple Markdown wiki from raw source files.

## Core idea

This repo has two important folders:

- `/sources` contains raw source material. Treat this as read-only.
- `/wiki` contains synthesized Markdown pages. Create and update these.

Your job is to turn messy source material into a clean, linked Markdown wiki.

## Folder rules

1. Never modify files in `/sources` unless the user explicitly asks.
2. Write new knowledge pages in `/wiki`.
3. Update existing `/wiki` pages before creating duplicate pages.
4. Keep `/wiki/index.md` updated as the main navigation page.
5. Prefer small, clear pages over one giant page.
6. Keep source references visible so the user knows where each claim came from.

## When the user adds sources

1. Read new files in `/sources`.
2. Extract durable facts, decisions, people, projects, entities, dates, and open questions.
3. Update existing pages in `/wiki` before creating new ones.
4. Add links between related pages.
5. Keep claims tied to source filenames.
6. Flag contradictions instead of hiding them.
7. Keep `/wiki/index.md` updated.

## Commands the user may give

### Ingest

If the user says something like:

```text
ingest sources
```

or:

```text
Ingest all files in /sources and update /wiki according to AGENTS.md.
```

Then:

1. Scan `/sources`.
2. Identify new or changed material.
3. Update `/wiki` pages.
4. Update `/wiki/index.md`.
5. Summarize what changed.

### Ask

If the user asks a question, answer from `/wiki` first.

If `/wiki` is incomplete, check `/sources`, update the wiki if useful, then answer.

Use this behavior for prompts like:

```text
Answer this using /wiki first. If the wiki is incomplete, update it from /sources, then answer:

[QUESTION]
```

### Clean up / lint

If the user says:

```text
lint wiki
```

or:

```text
Lint the wiki. Find duplicates, contradictions, missing source references, and pages that should be merged.
```

Then look for:

- duplicate pages
- stale pages
- missing links
- missing source references
- contradictions between pages
- pages that should be merged
- important source files that are not represented in the wiki

## Wiki page format

Each page should use this format:

```md
# Title

## Summary
Brief explanation.

## Key facts
- Fact — source: `sources/file-name.ext`

## Related
- [[Other Page]]

## Open questions
- Question or uncertainty
```

## Source references

Every important factual claim should include a source reference when possible.

Good:

```md
- The project uses a read-only `sources/` folder and generated `wiki/` pages — source: `sources/project-notes.md`
```

Bad:

```md
- The project uses a read-only sources folder.
```

## Contradictions

Do not silently choose one version if sources disagree.

Instead, create or update a section like:

```md
## Contradictions / conflicts
- `sources/a.md` says the launch date is June 1.
- `sources/b.md` says the launch date is June 15.
- Needs confirmation.
```

## Index page

Keep `/wiki/index.md` useful.

It should contain:

- a short description of the wiki
- links to main pages
- important open questions
- recently updated pages if useful

## Final response after edits

After updating the wiki, tell the user:

1. Which source files you read.
2. Which wiki pages you created or updated.
3. Any contradictions or open questions found.
4. Suggested next source files to add, if relevant.
