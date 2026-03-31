---
description: "Understand root causes before adding complexity — simplify, reduce, then add as last resort"
globs: ["**/*"]
---

# First Principles Over Bolt-Ons

Most problems are symptoms. Understand -> Simplify -> Reduce -> Add (last resort). Don't accrue technical debt through band-aid solutions.

Bad: Page slow -> add caching layer. Actual issue: bad SQL query.
Correct: Profile -> fix query. No new components needed.
