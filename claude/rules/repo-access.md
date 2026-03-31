---
description: "How to interact with the brain repo — use brain-* scripts, never raw git"
globs: ["**/*"]
---

# Repo Access

All interaction with the brain repo goes through the `$BRAIN_DIR/bin/brain-*` scripts. Never use raw git commands in this repo.

## Commands

| Script | Purpose | Args |
|--------|---------|------|
| `brain-observe` | Record an observation | `<slug> <content>` |
| `brain-save` | Stage all and commit | `"commit message"` |
| `brain-status` | Show repo status | any git status args |
| `brain-log` | Show commit history | any git log args |
| `brain-publish` | Push to remote | none |

## Commit Message Conventions

Prefix messages with the action:
- `observe: ...` — after writing an observation
- `dream: ...` — after a dream cycle
- `export: ...` — after regenerating exports
- `rule: ...` — after changing a steering rule
- `skill: ...` — after changing a skill
- `context: ...` — after a direct context edit (rare, usually via dreaming)

## When to Publish

- After a dream cycle (dream + publish)
- When explicitly asked
- Not after every observation — those accumulate locally
