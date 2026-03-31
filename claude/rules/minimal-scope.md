---
description: "Only change what was asked — no bonus refactoring, no extra cleanup"
globs: ["**/*"]
---

# Minimal Scope

Only change what was asked. No bonus refactoring, no extra cleanup, no "while I'm here" improvements.

Read before modifying. Understand existing code, imports, and patterns first.

When debugging, make one change at a time. Isolate, verify, proceed.

Bad: Fix line 42 bug, also refactor whole file -> 200-line diff.
Correct: Fix the bug -> 1-line diff.
