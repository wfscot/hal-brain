# hal-brain

A personal AI assistant's brain — identity, skills, knowledge, and memory in a git repo.

## How It Works

The assistant's configuration (CLAUDE.md, rules, skills) lives in `claude/` and gets symlinked into `~/.claude/` by `install.sh`. This makes the assistant's identity, steering rules, and skills available globally across all Claude Code sessions regardless of working directory.

Knowledge about the principal (the person the assistant works for) lives in `context/`. This is private to the assistant and updated only through the dream process.

Other agents can consume a distilled, read-only subset of the assistant's knowledge via rulesync exports.

## Setup

```bash
./install.sh
```

This:
- Symlinks `claude/CLAUDE.md`, `claude/rules/`, `claude/skills/` into `~/.claude/`
- Injects `BRAIN_DIR` env var and `brain-*` script permissions into `~/.claude/settings.json`
- Creates `context/`, `observations/`, and `exports/` directories if missing

On first session after install, the assistant will run `/whoami` (to establish its identity) and `/interview` (to learn about the principal).

## Structure

```
hal-brain/
├── install.sh                  # Wires claude/ into ~/.claude/
├── claude/                     # Symlinked into ~/.claude/
│   ├── CLAUDE.md               # Bootstrap — identity, write path rules
│   ├── rules/                  # Steering rules (loaded every session)
│   └── skills/                 # Skills (loaded on demand)
├── context/                    # Durable knowledge (written only by /dream)
│   ├── self.md                 # Who the assistant is
│   ├── principal.md            # Who the assistant works for
│   ├── people.md               # People in the principal's life and work
│   └── projects/               # Project knowledge by domain
├── observations/               # Append-only raw notes (via brain-observe)
│   └── processed/              # Observations consumed by /dream
├── exports/rulesync/           # Distilled knowledge for other agents
│   ├── rules/                  # Always-on context (principal, etc.)
│   ├── skills/                 # On-demand context (domains, projects)
│   └── agents/                 # Optional personality (hal-proxy)
├── bin/                        # brain-* scripts for repo operations
└── rulesync.jsonc              # Config for rulesync export consumers
```

## Skills

| Skill | Purpose |
|-------|---------|
| `/whoami` | Establish or update the assistant's identity |
| `/interview` | Discover or refresh knowledge about the principal |
| `/dream` | Process observations into context, regenerate exports |
| `/consult` | Strategic advisory — help the principal focus on what matters |
| `/algorithm` | Structured 7-phase execution with verifiable criteria |
| `/council` | Multi-perspective debate |
| `/first-principles` | Decompose, challenge assumptions, reconstruct |
| `/red-team` | Adversarial stress-testing |

## Brain Scripts

| Script | Purpose |
|--------|---------|
| `brain-observe <slug> <content>` | Record an immutable observation |
| `brain-save <message>` | Stage all and commit |
| `brain-status [args]` | Git status |
| `brain-log [args]` | Git log |
| `brain-publish` | Git push |

## Write Path Discipline

- **context/** and **exports/** — only modified by `/dream`. Never edited directly.
- **observations/** — append-only via `brain-observe`. Never edited or deleted.
- **claude/rules/**, **claude/skills/**, **bin/** — can be edited directly when asked.

## For Other Agents

Other workspaces consume exported knowledge via rulesync. Add to `rulesync.local.jsonc`:

```jsonc
{
  "sources": [
    { "source": "<path-to-hal-brain>", "transport": "local", "path": "exports/rulesync/rules" },
    { "source": "<path-to-hal-brain>", "transport": "local", "path": "exports/rulesync/skills" },
    { "source": "<path-to-hal-brain>", "transport": "local", "path": "exports/rulesync/agents" }
  ]
}
```

Exports provide:
- **Rules** (always loaded): principal context with domain index
- **Skills** (on demand): domain-specific context (IFC, personal, etc.) with nested project details
- **Agents** (optional): hal-proxy — a read-only personality projection
