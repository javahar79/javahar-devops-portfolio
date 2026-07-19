---
last_verified: 2026-07-19
tool_version: n/a
---

# CI/CD workflow in my portfolio

I looked through my repo to map out the CI/CD pieces I've been building. Here's what I found:

- **GitHub Actions** (`github-actions/`) — I have a primer, UI walkthrough notes, CI workflow configs, and docs on reading logs. The configs in `configs/` define workflows that trigger on push and pull requests. The docs in `docs/` cover how I learned to debug workflow failures.
- **No Jenkins yet** — Jenkins is still locked (not available at my current level). The README says "linking GitHub Actions and Jenkins directories" but Jenkins doesn't have a directory yet. I'll add it once the tool unlocks.

The GitHub Actions workflows are the core of my CI/CD practice right now. They check out code, run basic validation, and let me experiment with pipeline debugging. Once I unlock more tools, I'll expand this section to cover multi-stage pipelines and deployment workflows.
