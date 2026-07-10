---
last_verified: 2026-07-10
tool_version: n/a
sources: []
---

# GitHub Actions quickstart — round two

I'd already run the basic hello-world workflow yesterday. This time I wanted to push past the example and understand triggers, environment variables, and job dependencies.

## What I tried

Started from the quickstart template but expanded it. Added two jobs: `lint` and `test`, with `needs: lint` so test runs only if lint passes. Also set `on: [push, pull_request]` to test both triggers.

Set a job-level env var: `MY_VAR: hello` and referenced it as `${{ env.MY_VAR }}` in a step. That worked. Then tried org-level secrets — created `MY_SECRET` in the repo settings and accessed it with `${{ secrets.MY_SECRET }}`. The output was masked automatically in the logs, which was a nice surprise.

## Where I got stuck

**Trigger filtering is finicky.** I wanted the workflow to skip pushes if only the README changed. Used `push: paths-ignore: ['*.md']` but the syntax tripped me up a few times — I kept nesting it wrong. Once I got it right, pushes with only markdown changes correctly skipped the workflow. Good for avoiding unnecessary CI runs.

**Env vars in `run:` blocks don't expand by default.** Tried `echo $MY_VAR` and got nothing. In a `run:` step on Ubuntu, you need to use `${{ env.MY_VAR }}` for Actions context variables, or `$MY_VAR` for shell-native variables set via `export`. Mixed them up at first.

**The `actions/checkout@v4` gotcha again.** I assumed the second job (`test`) would automatically have the code — nope, each job starts fresh. You need checkout in every job that touches the repo.

**Debugging without the UI is hard.** The YAML didn't validate once and I had to look at the Actions tab to see the error. Found I can use `act` (nektos/act) to run workflows locally, which gives faster feedback. Worth setting up.

## What I'd try next

- Matrix strategy — same steps across Ubuntu, macOS, Windows
- Artifact upload between jobs so test output from one job feeds the next
- A Docker-based job with a custom container
