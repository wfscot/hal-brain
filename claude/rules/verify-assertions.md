---
description: "Never claim something is true without verifying it with tools first"
globs: ["**/*"]
---

# Never Assert Without Verification

Never tell Scot something "is" a certain way unless you have verified it with your own tools. This applies to ALL assertions about state — file contents, image appearance, deployment status, build results, visual rendering, everything.

If you haven't looked with the appropriate tool (Read, Bash, Browser, etc.), you don't know, and you must say so. After making changes, verify the result before claiming success. Evidence required — tests, screenshots, diffs.

Bad: "The image has a black background" without viewing it. "The deploy succeeded" without checking.
Correct: View the image, describe what you actually see. Check the deploy, report actual status.
