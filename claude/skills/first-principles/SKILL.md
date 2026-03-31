---
name: first-principles
description: "Decompose to fundamentals, challenge assumptions, reconstruct from verified truths. USE WHEN first principles, root cause, decompose, challenge assumptions, why do we, is this actually required, rebuild from scratch, constraint analysis."
---

# First Principles — Reasoning from Fundamentals

Deconstruct problems to fundamental truths rather than reasoning by analogy. When someone says "this is how it's done," ask "but why?"

## The 3-Step Framework

### 1. Deconstruct

"What is this actually made of?"

- Break down to constituent parts and fundamental truths
- Identify actual costs, values, and dependencies — not market prices or conventional wisdom
- Go deeper than the first layer. "We need a database" → what do we actually need to store, query, and guarantee?

**Key questions:**
- What is this actually made of?
- What are the constituent parts?
- What is the actual cost/value of each part?

### 2. Challenge

"Is this a law of physics, or is it a choice someone made?"

Classify every constraint:

| Type | Definition | Can Change? |
|------|------------|-------------|
| **Hard** | Physics, math, legal requirement | No |
| **Soft** | Policy, convention, "how we've always done it" | Yes |
| **Assumption** | Unvalidated belief, untested hypothesis | Maybe false |

Only hard constraints are truly immutable. Everything else is fair game.

**The Remove-It Test:** For each soft constraint or assumption, ask: "What happens if we simply remove this?" If the answer is "nothing bad" or "we'd have to solve X differently," it's not a real constraint.

**Challenge questions by domain:**

- **Technical:** Is this technology choice a constraint or a preference? What if we used something completely different?
- **Business:** Is this a real requirement or a stakeholder assumption? What evidence supports it?
- **Architecture:** Is this boundary load-bearing or legacy? What if we redrew it?
- **Process:** Is this step necessary or ritual? What if we skipped it?

### 3. Reconstruct

"Given only the truths, what's optimal?"

- Start from ONLY the hard constraints
- Design for function, not form
- Look at how other fields solved analogous problems
- The simplest solution that satisfies only hard constraints is the starting point

**Key questions:**
- If we started from scratch with only the fundamental truths, what would we build?
- What's the simplest solution that satisfies only the hard constraints?
- Are we optimizing function or form?

## Output

When presenting a first-principles analysis:

1. **Deconstruction** — constituent parts and actual values
2. **Constraint table** — each constraint classified as hard/soft/assumption with evidence
3. **Reconstruction** — what you'd build from fundamentals alone
4. **Key insight** — one sentence: what assumption was limiting us?

## When to Use

- "We need microservices because that's how modern apps are built" → challenge the assumption
- "This costs $X" → deconstruct the cost, find what's actually expensive
- "We can't do that because of [policy]" → is it a hard constraint or a choice?
- When stuck — deconstruct, find the real constraint, rebuild around it

## Anti-Patterns

- **Reasoning by analogy**: "Company X does it this way" — that's their context, not yours
- **Soft constraint worship**: Treating policies and conventions as physics
- **Form fixation**: Improving the suitcase instead of adding wheels
