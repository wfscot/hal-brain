---
name: red-team
description: "Adversarial stress-testing — find fatal flaws before they find you. USE WHEN red team, attack, counterarguments, critique, stress test, poke holes, devil's advocate, find weaknesses, break this, what could go wrong."
---

# Red Team — Adversarial Analysis

Find the fatal flaw in an idea, plan, or argument before reality does. Unlike council (collaborative debate), red team is purely adversarial — the goal is destruction, not consensus.

## Two Modes

### Parallel Analysis (stress-test an existing idea)

**The Five Phases:**

1. **Decompose** — Break the argument into atomic claims (8-24 depending on complexity). Use first-principles deconstruction if the claims are fuzzy.

2. **Attack** — Spawn parallel agents, each examining the claims from a different angle. Use diverse perspectives:

   | Category | Perspectives | Focuses On |
   |----------|-------------|------------|
   | Engineers | Pragmatist, Skeptic, Edge-case hunter, Performance critic | Technical feasibility, implementation reality |
   | Architects | Systems thinker, Scalability critic, Dependency mapper, Simplicity advocate | Structural soundness, hidden complexity |
   | Adversaries | Attacker, Insider threat, Competitor, Regulator | Security, abuse, competitive response, compliance |
   | Fresh eyes | New hire, End user, Outsider, Future maintainer | Assumptions, usability, sustainability |

   Each agent must identify both strengths AND weaknesses. Pure negativity misses the point — the goal is finding the ONE thing that could collapse the plan.

3. **Synthesize** — Where do multiple agents converge on the same concern? Convergent criticism is a strong signal. Unique insights from single agents are also valuable.

4. **Steelman** — Build the strongest possible version of the argument. 6-8 points. If you can't steelman it, you don't understand it well enough to attack it.

5. **Counter-argument** — The devastating rebuttal. 6-8 points. Lead with the single most critical flaw. Each point should reference specific evidence from the analysis.

### Adversarial Validation (produce something new via competition)

For when you need to GENERATE the best answer, not just critique an existing one.

1. **Competing proposals** — Spawn 2-3 agents with different approaches to the same problem. Each produces a complete proposal.
2. **Brutal critique** — A critic agent evaluates all proposals. No mercy. Find what's weak in each.
3. **Synthesis** — Take the strongest elements from each proposal, informed by the critique, and build the best solution.

Good persona combinations:
- **Architecture**: Minimalist vs. Enterpriser vs. Pragmatist
- **Strategy**: Aggressive growth vs. Conservative vs. Contrarian
- **Code**: Performance-first vs. Readability-first vs. Security-first

## Output

**Parallel Analysis produces:**
- Steelman (6-8 points) — strongest version of the argument
- Counter-argument (6-8 points) — strongest rebuttal, leading with the critical flaw
- Key convergence — what multiple perspectives agreed on

**Adversarial Validation produces:**
- Competing proposals (2-3)
- Critique of each
- Synthesized best solution

## When to Use

- Before committing to a major architectural decision
- Before presenting a plan to stakeholders
- When Scot says "poke holes in this" or "what am I missing"
- When something feels too clean — if nobody can attack it, either it's genuinely good or you haven't looked hard enough

## When NOT to Use

- Clear-cut decisions with obvious answers
- When speed matters more than correctness
- When morale matters — red teaming someone's work they're proud of needs to be requested, not volunteered
