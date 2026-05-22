$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path sources | Out-Null
New-Item -ItemType Directory -Force -Path wiki | Out-Null
New-Item -ItemType Directory -Force -Path docs | Out-Null
New-Item -ItemType Directory -Force -Path scripts | Out-Null

if (!(Test-Path AGENTS.md)) {
@'
# LLM Wiki Agent

You maintain a simple Markdown wiki from raw source files.

- /sources contains raw source material. Treat it as read-only.
- /wiki contains synthesized Markdown pages. Create and update these.

When asked to ingest sources, read /sources and update /wiki.
'@ | Set-Content AGENTS.md -Encoding UTF8
}

if (!(Test-Path agent.md)) {
@'
# LLM Wiki Agent

Read AGENTS.md for the main instructions.
'@ | Set-Content agent.md -Encoding UTF8
}

if (!(Test-Path wiki/index.md)) {
@'
# Wiki Index

No source files have been added yet.

Add raw materials to `sources/`, then ask the agent to synthesize/update wiki pages here.
'@ | Set-Content wiki/index.md -Encoding UTF8
}

# Make sure GitHub tracks the folder even before real files are added.
New-Item -ItemType File -Force -Path sources/.gitkeep | Out-Null

Write-Host "LLM Wiki Agent folder is ready."
Write-Host "Next: add files to sources/, open this folder with your agent, and say:"
Write-Host "Read AGENTS.md. Ingest all files in /sources and update /wiki."
