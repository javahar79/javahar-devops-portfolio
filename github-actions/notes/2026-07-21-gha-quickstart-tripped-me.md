---
last_verified: 2026-07-21
tool_version: n/a
sources:
  - https://timesofcloud.com/github-actions/jobs-runners-exercises/
  - https://blog.overflowbyte.cloud/beginners-guide-to-building-a-professional-cicd-pipeline-from-scratch
  - https://medium.com/@m.nomi1616/i-built-a-full-ci-cd-pipeline-from-scratch-heres-everything-that-broke-and-how-i-fixed-it-74b27fcefd54
  - https://dev.to/dr_rvinobchander_ac6a/build-your-first-cicd-pipeline-with-github-actions-complete-beginners-guide-6fj
---

# GitHub Actions quickstart — what tripped me up

I followed the official GitHub Actions quickstart and wrote down what worked and what didn't.

## What I did

Created `.github/workflows/ci.yml` with the simplest possible workflow — an `echo` step that runs on every push. I used `actions/checkout@v4` so the runner could actually see my repo files, and added `actions/setup-node@v4` so I could run `npm ci` and `npm test`. Pushed to a feature branch and watched the run complete in the Actions tab.

The first run was straightforward. The second run is where things got interesting.

## Where it broke

I changed `on: [push]` to `on: [push, pull_request]` targeting only `main`, and immediately forgot I had no `if:` guard on my deploy step. The deploy job ran on a feature-branch push and failed because there was nothing to deploy yet. That's on me — the quickstart doesn't warn you that `push` fires for every branch by default.

The next surprise was `npm ci` failing with "package-lock.json not found." I'd deleted the lockfile during a local cleanup and forgotten to regenerate it. `npm ci` requires that lockfile to exist and match the installed tree; `npm install` would have worked but creates a different dependency graph. The fix was just committing the lockfile, but I spent ten minutes reading error output before it clicked.

I also tried adding `workflow_dispatch` so I could re-run the workflow manually without pushing. That worked, but I didn't realize at first that `workflow_dispatch` doesn't automatically include the `push` trigger — I had to list both in the `on:` block. The quickstart docs mention this but it's easy to miss if you're skimming.

## What I'd try next

- Add a second job with `needs:` so I can see the dependency syntax in action
- Run the same workflow on `ubuntu-latest` and `windows-latest` via a matrix
- Add a step that intentionally `exit 1` to see what the failure UI looks like
- Try `actions/upload-artifact` to pass files between jobs

The quickstart gets you a green checkmark in under five minutes. The real learning starts when you change one thing and watch where it breaks.
