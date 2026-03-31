---
name: algorithm
description: "Structured execution for complex work — 7 phases with verifiable criteria. USE WHEN algorithm, complex task, multi-step, build, design, implement, architect, plan and execute."
---

# Algorithm — Structured Execution

Transition from CURRENT STATE to IDEAL STATE using verifiable criteria (ISC). For complex, multi-step work that benefits from structured thinking.

## When to Use

Not everything needs this. Use the algorithm when:
- The task has multiple moving parts or unknowns
- Getting it wrong would be costly
- You need to verify completeness, not just "feel done"

For simple tasks, just do them. Don't force structure where it adds no value.

## Effort Tiers

| Tier | ISC Floor | When |
|------|-----------|------|
| **Quick** | 4-8 | Straightforward but multi-step |
| **Standard** | 8-16 | Normal complex work |
| **Deep** | 16+ | Significant design, architecture, or investigation |

## The 7 Phases

### 1. OBSERVE

Reverse-engineer the request:
- What did Scot explicitly ask for?
- What's implied but not stated?
- What does he explicitly NOT want?
- What's obviously undesirable even if not stated?

Determine effort tier. Generate ISC criteria.

**ISC Splitting Test** — apply to EVERY criterion:
1. **"And"/"With" test**: Contains "and", "with", "including" joining two verifiable things? → split
2. **Independent failure test**: Can part A pass while part B fails? → separate criteria
3. **Scope word test**: "All", "every", "complete" → enumerate what "all" means
4. **Domain boundary test**: Crosses UI/API/data/logic boundaries? → one per boundary

Every criterion must be atomic: one verifiable end-state, 8-12 words, binary testable.

**ISC Count Gate**: Cannot proceed with fewer criteria than the effort tier floor. If below, decompose further.

### 2. THINK

Pressure-test the plan:
- What are the riskiest assumptions? (2-6)
- Premortem: how could this fail? (2-6 scenarios)
- What prerequisites might we be missing?

Refine ISC based on risks discovered.

### 3. PLAN

Technical approach:
- Validate prerequisites
- Identify the sequence of work
- Note key decisions and trade-offs

For Deep effort, present the plan and wait for approval before proceeding.

### 4. BUILD

Preparation and capability invocation. If thinking skills (council, first-principles, red-team) would help, invoke them here. If research is needed, do it here.

### 5. EXECUTE

Do the work. As each criterion is satisfied, note it. Don't wait for verify — track progress as you go.

### 6. VERIFY

Test every criterion. For each one:
- Is it actually complete? (not "feels done" — verify with evidence)
- Read the file, run the test, check the output

If any criterion fails, fix it before declaring done.

### 7. LEARN

Brief reflection:
- What should I have done differently?
- What would a better approach have looked like?
- Record observations for anything learned about Scot, the project, or the domain.
