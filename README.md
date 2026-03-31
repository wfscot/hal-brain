# hal-brain

Hal's brain — the personal AI assistant workspace for Scot Hastings.

## Structure

```
hal-brain/
├── install.sh                  # Symlinks claude/ into ~/.claude/
├── claude/                     # Everything that gets symlinked into ~/.claude/
│   ├── CLAUDE.md               # Identity + context routing (global)
│   ├── rules/                  # Steering rules (global, every project)
│   └── skills/                 # Hal's skills (global, every project)
├── exports/rulesync/           # Published for OTHER agents via rulesync
│   ├── rules/                  # Principal context, IFC context, team
│   └── skills/                 # (future: shared skills)
├── context/                    # Hal's durable knowledge (updated during dreaming)
│   ├── self.md                 # Who Hal is
│   ├── principal.md            # Who Hal works for
│   ├── team.md                 # People Hal works with
│   └── projects/               # Project knowledge
├── observations/               # Append-only during work sessions
│   └── processed/              # Processed observations (audit trail)
└── rulesync.jsonc              # Config for exports (consumed by other workspaces)
```

## Setup

```bash
./install.sh
```

This symlinks `claude/` into `~/.claude/` so Hal's identity, rules, and skills are available in every Claude Code session regardless of working directory.

## For other agents

Other workspaces can consume Hal's exported context via rulesync. Add to `rulesync.local.jsonc`:

```jsonc
{
  "sources": [
    { "source": "~/workspaces/hal-brain", "transport": "local", "path": "exports/rulesync/rules" },
    { "source": "~/workspaces/hal-brain", "transport": "local", "path": "exports/rulesync/skills" }
  ]
}
```

## Key concepts

- **claude/** is the source of truth for `~/.claude/`. Nothing is mastered in `~/.claude/` — it's all symlinks.
- **context/** is Hal's private knowledge, updated only during dreaming.
- **observations/** is append-only during work. No contention, no corruption. Archive lives under `observations/processed/`.
- **exports/** is distilled from context/ for other agents. Never hand-edited, never consumed by Hal.
- **Dreaming** processes observations into context, moves them to processed, then regenerates exports.
