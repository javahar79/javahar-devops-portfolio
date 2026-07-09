---
last_verified: 2026-07-09
tool_version: n/a
sources:
  - https://github.com/resources/articles/ci-cd
---

# GitHub Actions quickstart — what tripped me up

I followed the official GitHub Actions quickstart and here's what happened.

## The setup

Created a `.github/workflows/ci.yml` file in my repo. The docs say to start with a simple workflow that runs `echo` on push. I copied the example almost verbatim:

```yaml
name: learn-github-actions
on: [push]
jobs:
  echo-job:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Hello, workflow"
```

Pushed and it ran in seconds. Ok, that was easy.

## Where it broke

The quickstart example uses `on: [push]` which triggers on _every_ push to any branch. For my test repo that's fine, but I can see how that'd flood the Actions tab fast. I changed it to `on: [push, pull_request]` and targeted `main` only so it's more realistic.

Next: I tried adding a step that needed the repo's files (`ls README.md`), but the step couldn't find it. Turns out the checkout action is not automatic — you have to add `uses: actions/checkout@v4` before any step that needs the code. The quickstart mentions this in the "Understanding the workflow file" section, but I skipped it the first read-through.

I also tried triggering the workflow from the `workflow_dispatch` event so I could run it manually from the Actions tab without pushing. That worked as an alternative to `on: [push]` for testing.

## What I'd try next

- Add a second job that runs after the first one passes to see the dependency syntax (`needs:`)
- Try matrix builds — running the same steps on ubuntu and macos to compare
- Break a step intentionally (exit 1) to see what the failure UI looks like
- Use `actions/upload-artifact` to persist files across jobs

The quickstart gets you running in 60 seconds, but the real learning is in what happens when you deviate from the happy path.
