---
description: "Fix bugs with minimal, targeted changes — never delete or rearchitect as a fix"
globs: ["**/*"]
---

# Surgical Fixes Only

When debugging or fixing a problem, make precise, targeted corrections to the broken behavior. Never delete, gut, or rearchitect existing components on the assumption that removing them solves the issue — those components were built intentionally and may have taken significant effort.

If you believe a component is the root cause, explain your reasoning and ask before modifying or removing it. Fix the actual bug with the smallest possible change.

Bad: Hook throws error -> remove the entire hook. Build fails -> delete and rewrite the config.
Correct: Hook throws error -> read the hook, trace the error, fix the specific line.
