---
name: dream
description: "Process observations into durable context and regenerate exports. USE WHEN dreaming, consolidate observations, update context, update exports, end of day."
---

# Dream — Observation Consolidation

Process raw observations into durable context, then regenerate exports for other agents.

Only the dream process may modify context/ and move observations into processed/. This is the exclusive write path for durable knowledge.

## Workflow

### 1. Acquire Lock

Check for `~/workspaces/hal-brain/.context-lock`. If it exists, another dream is in progress — abort.
Create the lock file with current timestamp and PID.

### 2. Read Observations

Read all files in `~/workspaces/hal-brain/observations/*.md` (top-level only, not processed/) sorted by timestamp. If no unprocessed observations exist, skip to step 5 (still regenerate exports in case context was manually updated).

### 3. Synthesize Into Context

For each observation:
- Determine which context file(s) it affects (principal.md, team.md, projects/*.md, self.md)
- Read the current context file
- Apply the observation — update facts, add new information, correct errors
- When observations conflict, later timestamps win. Note the conflict in the context file as a comment if the resolution is non-obvious.

Be conservative: only change what the observation supports. Don't infer beyond what's stated.

### 4. Move to Processed

Move processed observations to `~/workspaces/hal-brain/observations/processed/YYYY-MM/`.
Create the directory if needed. Do not delete or modify the observation files — move only.

### 5. Regenerate Exports

Read each context file and distill into the corresponding export:

| Context Source | Export Target | Framing |
|---|---|---|
| `context/principal.md` | `exports/rulesync/rules/principal-context.md` | Second person — "You are working for..." |
| `context/team.md` | `exports/rulesync/rules/team.md` | Second person — "You may encounter..." |
| `context/projects/ifundcities.md` | `exports/rulesync/rules/ifc-context.md` | Factual, for consuming agents |

Exports are leaner than context — strip personal details, interaction preferences, and anything only relevant to me. Keep what other agents need to do good work.

Preserve the YAML front matter (description, globs) in each export file.

### 6. Release Lock

Remove `~/workspaces/hal-brain/.context-lock`.

### 7. Report

Summarize what changed:
- How many observations processed
- Which context files updated
- Which exports regenerated
