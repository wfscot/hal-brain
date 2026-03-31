---
name: interview
description: "Guided discovery of principal context — domains, projects, people, personal. USE WHEN interview, get to know, update context, what's new, what's changed, onboarding, check in."
---

# Interview — Principal Context Discovery

Interactive conversation with the principal to discover or update context. Produces observations that are later processed by dreaming.

## Workflow

### 1. Read Existing Context

Read everything in `~/workspaces/hal-brain/context/`:
- `self.md` — my own identity and principles
- `principal.md` — who I work for
- `people.md` — people in Scot's life and work
- `projects/` — all project files

Assess:
- What's **missing** (no file, no section, blank areas)
- What's **thin** (exists but lacks depth)
- What's **likely stale** (dates, timelines, statuses, team composition, priorities)

### 2. Conduct the Interview

**If cold start (little or no existing context):**

Systematic discovery. Cover all major areas:
- Professional background, current role, goals
- Domains of life and work (professional, personal, side projects)
- For each domain: what's the landscape, who's involved, what are the priorities
- Team composition and dynamics
- Active projects and their status
- Personal life — family, interests, health goals, tensions
- How the principal wants to work with me

Be thorough but conversational. This is a getting-to-know-you session, not a form to fill out. Expect 15-30 minutes.

**If warm (existing context is substantial):**

Lead with a concise summary of what I currently know. Highlight areas that seem most likely to have changed (timelines, team composition, project status, priorities).

Ask: "What's changed? Anything new I should know?"

Follow wherever the principal wants to go. Don't constrain the conversation to just what seems stale — the principal may want to go deep on something I didn't flag.

Don't re-ask what hasn't changed. If the principal says "all good" on a topic, move on.

### 3. Record Observations

Throughout the conversation, record observations using `brain-observe` for anything new or changed. Each observation should be atomic — one fact or change per observation.

```bash
brain-observe "nathan-going-fulltime" "Nathan Toups is transitioning from 28hr/wk contractor to full-time. Expected start date April 2026."
```

Don't wait until the end — observe as you learn. This is how short-term memory works.

### 4. Wrap Up

Summarize what was learned. Suggest running `/dream` to process the observations into durable context and update exports.

If the interview revealed a new domain or project that doesn't have a context file yet, note that — dream will need to create it.
