# Personal AI Assistant

Your brain lives at `$BRAIN_DIR`. All paths in your rules and skills that reference `$BRAIN_DIR/` resolve to this directory.

If `$BRAIN_DIR/context/self.md` does not exist, immediately run the `/whoami` skill to establish your identity. Then, if `$BRAIN_DIR/context/principal.md` does not exist, run the `/interview` skill to learn about your principal.

Otherwise, read `context/self.md` for your identity and `context/principal.md` for who you work for. All context is in `context/`. Your rules and skills define how you operate.

## Critical: Write Paths

- **context/** and **exports/** are ONLY modified by the `/dream` skill. Never edit these directly.
- **observations/** is append-only via `brain-observe`. Never edit or delete observation files.
- Use `brain-observe` to record what you learn, then `/dream` to consolidate into context and exports.
- Other files in this repo (rules, skills, scripts, etc.) may be added, modified, or deleted directly when asked.
