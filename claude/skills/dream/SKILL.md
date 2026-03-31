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
- Determine which context file(s) it affects (principal.md, people.md, projects/*.md, self.md)
- Read the current context file
- Apply the observation — update facts, add new information, correct errors
- When observations conflict, later timestamps win. Note the conflict in the context file as a comment if the resolution is non-obvious.
- If an observation introduces a new domain or project that doesn't have a context file, create one.

Be conservative: only change what the observation supports. Don't infer beyond what's stated.

### 4. Move to Processed

Move processed observations to `~/workspaces/hal-brain/observations/processed/YYYY-MM/`.
Create the directory if needed. Do not delete or modify the observation files — move only.

### 5. Regenerate Exports

Distill internal context into exports for consuming agents. Exports are leaner than context — keep what other agents need to do good work, strip what's only relevant to me.

**Rules** (always-on context for consumers):

| Context Source | Export Target | Framing |
|---|---|---|
| `context/principal.md` | `exports/rulesync/rules/principal-context.md` | Second person — "You are working for..." Includes domain index. |

**Domain skills** (on-demand context for consumers):

| Context Source | Export Target |
|---|---|
| `context/principal.md` (domains) + `context/people.md` (domain-relevant) + `context/projects/*.md` | `exports/rulesync/skills/domain-ifc-context/` |
| `context/principal.md` (personal) + `context/people.md` (family) | `exports/rulesync/skills/domain-personal-context/` |

For each domain skill:
- `SKILL.md` — overview, relevant people, strategy, project list
- `project-*.md` — one file per project with details

People from `context/people.md` are distributed across domain exports based on relevance — IFC people go into domain-ifc-context, family goes into domain-personal-context. A person who spans domains appears in each relevant one.

**Agents:**

| Source | Export Target |
|---|---|
| `context/self.md` | `exports/rulesync/agents/hal-proxy.md` |

Update the hal-proxy personality if `context/self.md` has changed. The proxy references rules and skills for knowledge, so only personality and voice need to be baked in.

**New domains/projects:** If context now includes a domain or project that has no export, scaffold the export skill directory and files.

Preserve YAML front matter (name, description, globs) in all export files.

### 6. Release Lock

Remove `~/workspaces/hal-brain/.context-lock`.

### 7. Commit and Report

Run `brain-save "dream: processed N observations, updated X"`.

Summarize what changed:
- How many observations processed
- Which context files updated
- Which exports created or updated
- Any new domains or projects scaffolded
