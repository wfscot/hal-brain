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
# What gets modified in place:
#   ~/.claude/settings.json  — brain-* allows injected into existing file
#
# settings.json is NOT replaced. It may be a dotfiles symlink or a real file.
# Either way, install.sh reads it, ensures brain-* allows are present, and
# writes it back. Existing settings are preserved.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
BIN_DIR="${SCRIPT_DIR}/bin"

echo "=== hal-brain install ==="
echo "Brain:  ${SCRIPT_DIR}"
echo "Target: ${CLAUDE_DIR}"
echo ""

mkdir -p "${CLAUDE_DIR}"
mkdir -p "${SCRIPT_DIR}/observations/processed"

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

# --- Inject brain-* allows into settings.json ---
# Reads existing settings.json (which may be a real file or dotfiles symlink),
# ensures brain-* script allows are present, writes back. Idempotent.
SETTINGS_FILE="${CLAUDE_DIR}/settings.json"

python3 -c "
import json, os

settings_path = '${SETTINGS_FILE}'
bin_dir = '${BIN_DIR}'
home = os.path.expanduser('~')
scripts = ['brain-save', 'brain-status', 'brain-log', 'brain-publish', 'brain-observe']
local_bin = os.path.join(home, '.local', 'bin')

# Build the allow entries we need (absolute + tilde forms for both locations)
brain_allows = []
for script in scripts:
    # Full path in hal-brain/bin/
    abs_path = os.path.join(bin_dir, script)
    brain_allows.append(f'Bash({abs_path}:*)')
    if abs_path.startswith(home + '/'):
        tilde_path = '~/' + abs_path[len(home) + 1:]
        brain_allows.append(f'Bash({tilde_path}:*)')
    # ~/.local/bin/ path (where symlinks may live)
    local_path = os.path.join(local_bin, script)
    brain_allows.append(f'Bash({local_path}:*)')
    brain_allows.append(f'Bash(~/.local/bin/{script}:*)')
    # Bare command name (if on PATH, Claude may invoke without full path)
    brain_allows.append(f'Bash({script}:*)')

# Read existing settings (or start fresh)
if os.path.exists(settings_path):
    # Resolve symlink to read the actual file
    real_path = os.path.realpath(settings_path)
    with open(real_path) as f:
        settings = json.load(f)
else:
    settings = {}

# Ensure permissions.allow exists
settings.setdefault('permissions', {}).setdefault('allow', [])
existing = settings['permissions']['allow']

# Add brain-* allows that aren't already present
for allow in brain_allows:
    if allow not in existing:
        existing.append(allow)

# Write back (follows symlink, writes to actual file)
real_path = os.path.realpath(settings_path) if os.path.exists(settings_path) else settings_path
with open(real_path, 'w') as f:
    json.dump(settings, f, indent=2)
    f.write('\n')
" 2>&1

echo "[ok] settings.json updated (brain-* allows injected)"

# --- Symlink brain-* scripts into ~/.local/bin/ if available and on PATH ---
LOCAL_BIN="${HOME}/.local/bin"
if [ -d "${LOCAL_BIN}" ] && echo "${PATH}" | tr ':' '\n' | grep -qx "${LOCAL_BIN}"; then
  echo ""
  for script in "${BIN_DIR}"/brain-*; do
    name=$(basename "$script")
    target="${LOCAL_BIN}/${name}"
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$script" ]; then
      echo "[ok] ${name} (unchanged)"
    else
      ln -sf "$script" "$target"
      echo "[ok] ${name} → ${LOCAL_BIN}/"
    fi
  done
else
  echo ""
  echo "[warn] ~/.local/bin/ not found or not on PATH — brain-* scripts not linked."
  echo "       You can run them directly: ${BIN_DIR}/brain-save \"message\""
fi

echo ""
echo "=== install complete ==="
echo ""
echo "~/.claude/ now contains:"
echo "  CLAUDE.md      → ${SCRIPT_DIR}/claude/CLAUDE.md  (symlink)"
echo "  rules/         → ${SCRIPT_DIR}/claude/rules/     (symlink)"
echo "  skills/        → ${SCRIPT_DIR}/claude/skills/    (symlink)"
echo "  settings.json    (existing file, brain-* allows injected)"
