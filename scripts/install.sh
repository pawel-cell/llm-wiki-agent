#!/usr/bin/env bash
set -euo pipefail

mkdir -p sources wiki docs scripts

if [ ! -f AGENTS.md ]; then
  cat > AGENTS.md <<'EOF'
# LLM Wiki Agent

You maintain a simple Markdown wiki from raw source files.

- /sources contains raw source material. Treat it as read-only.
- /wiki contains synthesized Markdown pages. Create and update these.

When asked to ingest sources, read /sources and update /wiki.
EOF
fi

if [ ! -f agent.md ]; then
  cat > agent.md <<'EOF'
# LLM Wiki Agent

Read AGENTS.md for the main instructions.
EOF
fi

if [ ! -f wiki/index.md ]; then
  cat > wiki/index.md <<'EOF'
# Wiki Index

No source files have been added yet.

Add raw materials to `sources/`, then ask the agent to synthesize/update wiki pages here.
EOF
fi

# Make sure GitHub tracks the folders even before real files are added.
touch sources/.gitkeep

printf 'LLM Wiki Agent folder is ready.\n'
printf 'Next: add files to sources/, open this folder with your agent, and say:\n'
printf 'Read AGENTS.md. Ingest all files in /sources and update /wiki.\n'
