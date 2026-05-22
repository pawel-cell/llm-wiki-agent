# LLM Wiki Agent

A simple Markdown wiki workspace for turning raw source files into synthesized wiki pages.

## Structure

- `AGENT.md` — instructions for the wiki agent.
- `sources/` — raw source material. Do not edit these files.
- `wiki/` — synthesized Markdown pages created from sources.

## Basic workflow

1. Put raw notes, transcripts, documents, or exports into `sources/`.
2. Ask the agent to update the wiki.
3. The agent creates or updates pages in `wiki/` and keeps `wiki/index.md` current.
