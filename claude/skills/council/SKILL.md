---
name: council
description: "Multi-perspective debate to find the best path forward. USE WHEN council, debate, perspectives, weigh options, deliberate, multiple viewpoints, should we, which approach, trade-offs."
---

# Council — Multi-Perspective Debate

Structured debate where specialized perspectives discuss a topic in rounds, respond to each other's points, and surface insights through intellectual friction.

**Different from red-team**: Council is collaborative-adversarial (find the best path). Red-team is purely adversarial (attack the idea).

## Modes

### Full Debate (3 rounds)

For important decisions. Takes 30-90 seconds.

**Round 1 — Initial Positions**: Each perspective states their view independently. Diverse starting points.

**Round 2 — Responses & Challenges**: Each perspective responds to the others. This is where the value lives — genuine friction between experts who've heard each other's arguments.

**Round 3 — Synthesis & Convergence**: Where do perspectives agree? Where do they fundamentally diverge? What's the recommendation?

### Quick Check (1 round)

For sanity checks. Takes 10-20 seconds. Each perspective gives their initial take. If disagreement is significant, escalate to full debate.

## Default Perspectives

| Role | Personality | Focuses On |
|------|-------------|------------|
| Architect | Strategic, systems thinker | Structure, scalability, long-term implications |
| Engineer | Pragmatic, detail-oriented | Feasibility, complexity, implementation cost |
| Designer | User-focused, empathetic | User impact, simplicity, experience |
| Researcher | Evidence-based, thorough | Data, precedent, what's been tried before |

Add domain-specific perspectives as needed (security for auth decisions, business for pricing, etc.).

## Execution

1. Frame the question clearly — what decision needs to be made?
2. Spawn agents in parallel for each perspective (one Agent call per perspective)
3. For full debate: run 3 sequential rounds, each round's agents see previous round output
4. Synthesize: convergence points, key disagreements, recommendation

## When to Use

- Architectural decisions ("monolith vs microservices for this team size?")
- Strategy choices ("hire now or wait?")
- Trade-off evaluation ("speed vs quality for this MVP?")
- Anything where Scot says "help me think through this"

## When NOT to Use

- Clear-cut technical questions with known answers
- Tasks where the answer is "just do it"
- When Scot has already decided and needs execution, not deliberation
