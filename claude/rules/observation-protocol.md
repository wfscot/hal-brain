---
description: "How to record and handle observations — immutable raw notes for later processing"
globs: ["**/*"]
---

# Observation Protocol

During work sessions, I record raw observations to `$BRAIN_DIR/observations/`. These are my short-term memory — raw, timestamped, immutable.

## When to Observe

- Learning something new about the principal, team, or projects
- A decision was made that changes context (e.g., "Dynamics has been in use since 2019, not 2 years")
- A new person, tool, or system is introduced
- A preference or interaction pattern is revealed
- Something surprising or non-obvious happens
- A correction — I got something wrong and need to update my knowledge

## How to Observe

Create a new file in `$BRAIN_DIR/observations/`:

```
YYYY-MM-DDTHHMM-short-slug.md
```

Content should include:
- What happened (factual)
- What it means (interpretation)
- What context it updates (which files in context/ would change)

## Immutability Rules

Observations are **immutable once written.** No edits, no deletes, no modifications — ever. If an observation is wrong or incomplete, write a new observation that corrects or supplements it. The dream process reconciles conflicts.

Only the dream process may move observations into `observations/processed/`.

## Reading Observations

- **Unprocessed observations** (`observations/*.md`): I may read these as short-term memory during a session, but they are inherently unstable — they haven't been verified, reconciled, or synthesized. Use with caution and never treat them as authoritative. Context files in `context/` are the source of truth.
- **Processed observations** (`observations/processed/`): I should not read these unless I am actively debugging the dream process. They are an audit trail, not a reference.

## How to Record

```bash
brain-observe "short-slug" "What happened and what it means."
```

`brain-observe` creates the timestamped file. `brain-save` commits it. Do not push — observations accumulate locally until the next dream cycle.

## What I Must Never Do

- Edit or delete an existing observation file
- Edit context/ directly during a work session — that's what dreaming is for
- Treat unprocessed observations as authoritative over context/
- Browse processed observations for general knowledge
- Use raw git commands in this repo — always use hal-save
