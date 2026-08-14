---
last_verified: 2026-08-14
tool_version: n/a
sources: []
---

# Combining Git & Version Control with CI/CD Concepts — branch strategies for CI

## Purpose

This doc combines the Git & Version Control concept with the CI/CD Concepts concept:
the branch strategy a team chooses defines *when* pipelines run, *what* a merge means,
and *what* gets deployed. The repository isn't just a place to store code — it's the
trigger source for every automated run. This is the intersection I kept circling back
to once I understood CI/CD but still had vague "you should probably use branches"
advice floating around.

## When to use

- When deciding how a repo should be laid out before wiring a pipeline to it.
- When a pipeline runs on every branch and nobody can tell which commits are "real".
- When "releasing" means a manual tag-and-hope instead of a predictable flow.

## The main strategies

### Trunk-based development
Everyone commits short-lived feature branches (hours to a couple of days) and merges
straight to a single long-lived branch (`main`/`trunk`). The branch is kept
releasable at all times, so CI runs on every merge and any broken build blocks the
line immediately. This is the model that pairs best with continuous delivery —
deploys are small and frequent because the trunk is always near-releasable.

### GitFlow
A heavier model with long-lived `develop` and `release/*` branches on top of `main`.
Feature branches feed `develop`; a `release/x.y.z` branch is cut to stabilize a
version, then merged to both `main` and `develop`; hotfixes skip straight in. CI
gets more trigger points (one per branch type), and the pipeline is where each branch
gets validated differently — features get tests, release branches get full
verification plus version bump, `main` gets the deploy. Best suited to scheduled,
versioned releases where the branch names carry meaning.

### Feature-branch flow (GitHub Flow style)
A middle ground: one `main` plus short-lived branches opened with a pull request on
top. The merge is the gate — CI runs on the pull request, and branch protection only
lets a merge through when the required checks pass. The pull request becomes the
review-and-verify checkpoint, which is exactly where CI/CD concepts (required status
checks, review approvals) plug into version control.

## How branch strategy becomes CI policy

A branch strategy only matters if the pipeline enforces it. Three mechanisms:

- **Protected branches** — the long-lived branch (usually `main`) only accepts
  merges that pass the required CI checks, so broken code can't land silently.
- **Path-filtered triggers** — CI runs different jobs depending on which file paths a
  push touched (infra changes trigger the Terraform plan, app changes trigger the
  build). This keeps the pipeline narrow instead of rebuilding everything every push.
- **Environment mapping** — which branch a merge lands on decides which environment it
  reaches: e.g. every `main` merge goes to staging, and only a `release/*` merge or a
  specific tag promotes to the live environment. Version control names the branch,
  CI/CD reads that name and routes the artifact.

## A tiny example

A minimal CI trigger that reads the branch and decides what to do:

```yaml
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
jobs:
  ci:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: make test
      - name: Report branch
        run: echo "Pipeline on branch ${{ github.ref_name }}"
```

Here the pull-request trigger runs tests for review, while the `main` push trigger is
where a deploy step would go. One pipeline, two entry points, and version control
decides which one fires.

## Verify

Set up branch protection on `main`, make a commit on a topic branch, open a PR, and
watch CI run twice: once on the PR, once (if you merged) on the `main` push. That
double-trigger is the visible payoff of wiring version control to CI.

## Wrap

The branch strategy and the pipeline are two halves of one decision. Picking the
strategy first and then wiring the CI triggers, protected branches, and environment
mapping to match it removes most of the "why did that deploy?" mystery.