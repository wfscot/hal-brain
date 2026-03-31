#!/usr/bin/env bash
set -euo pipefail

# hal-brain install.sh
# Idempotent — wires hal-brain into ~/.claude/
# Safe to re-run at any time. The brain repo is the source of truth.
#
# What gets symlinked:
#   ~/.claude/CLAUDE.md  → hal-brain/claude/CLAUDE.md
#   ~/.claude/rules/     → hal-brain/claude/rules/
#   ~/.claude/skills/    → hal-brain/claude/skills/
#
# What gets injected into settings.json:
#   env.BRAIN_DIR        — absolute path to this repo
#   permissions.allow    — brain-* script allows (using $BRAIN_DIR paths)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
BIN_DIR="${SCRIPT_DIR}/bin"

echo "=== hal-brain install ==="
echo "Brain:  ${SCRIPT_DIR}"
echo "Target: ${CLAUDE_DIR}"
echo ""

mkdir -p "${CLAUDE_DIR}"
mkdir -p "${SCRIPT_DIR}/observations/processed"
mkdir -p "${SCRIPT_DIR}/context/projects"
mkdir -p "${SCRIPT_DIR}/exports/rulesync/rules"
mkdir -p "${SCRIPT_DIR}/exports/rulesync/skills"
mkdir -p "${SCRIPT_DIR}/exports/rulesync/agents"

# --- Helper: symlink a file, backing up if it's a real file ---
link_file() {
  local src="$1" dst="$2" name="$3"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -f "$dst" ]; then
    echo "[warn] ${dst} is a real file — backing up to ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$src" "$dst"
  echo "[ok] ${name}"
}

# --- Helper: symlink a directory, backing up if it's a real directory ---
link_dir() {
  local src="$1" dst="$2" name="$3"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -d "$dst" ]; then
    echo "[warn] ${dst} is a real directory — backing up to ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$src" "$dst"
  echo "[ok] ${name}"
}

# --- Symlink CLAUDE.md, rules/, skills/ ---
link_file "${SCRIPT_DIR}/claude/CLAUDE.md"  "${CLAUDE_DIR}/CLAUDE.md"  "CLAUDE.md  → claude/CLAUDE.md"
link_dir  "${SCRIPT_DIR}/claude/rules"      "${CLAUDE_DIR}/rules"      "rules/     → claude/rules/"
link_dir  "${SCRIPT_DIR}/claude/skills"     "${CLAUDE_DIR}/skills"     "skills/    → claude/skills/"

# --- Inject BRAIN_DIR env and brain-* allows into settings.json ---
SETTINGS_FILE="${CLAUDE_DIR}/settings.json"

python3 -c "
import json, os

settings_path = '${SETTINGS_FILE}'
brain_dir = '${SCRIPT_DIR}'
scripts = ['brain-save', 'brain-status', 'brain-log', 'brain-publish', 'brain-observe']

# Allow entries use absolute paths (assistant resolves via \$BRAIN_DIR)
brain_allows = [f'Bash({brain_dir}/bin/{s}:*)' for s in scripts]

# Read existing settings (or start fresh)
if os.path.exists(settings_path):
    real_path = os.path.realpath(settings_path)
    with open(real_path) as f:
        settings = json.load(f)
else:
    settings = {}

# Inject BRAIN_DIR env var
settings.setdefault('env', {})['BRAIN_DIR'] = brain_dir

# Replace all brain-* allows (remove stale, add current)
settings.setdefault('permissions', {}).setdefault('allow', [])
existing = [a for a in settings['permissions']['allow'] if 'brain-' not in a]
settings['permissions']['allow'] = existing + brain_allows

# Write back (follows symlink, writes to actual file)
real_path = os.path.realpath(settings_path) if os.path.exists(settings_path) else settings_path
with open(real_path, 'w') as f:
    json.dump(settings, f, indent=2)
    f.write('\n')
" 2>&1

echo "[ok] settings.json updated (BRAIN_DIR env + brain-* allows)"

echo ""
echo "=== install complete ==="
echo ""
echo "~/.claude/ now contains:"
echo "  CLAUDE.md      → ${SCRIPT_DIR}/claude/CLAUDE.md  (symlink)"
echo "  rules/         → ${SCRIPT_DIR}/claude/rules/     (symlink)"
echo "  skills/        → ${SCRIPT_DIR}/claude/skills/    (symlink)"
echo "  settings.json    (BRAIN_DIR=${SCRIPT_DIR}, brain-* allows)"
