---
last_verified: 2026-09-13
tool_version: n/a
---

# Dependabot — quick primer

> First-day notes for someone who's never used Dependabot. Personal voice, plain language.

## What is it?

Dependabot is a free service, built into GitHub, that automatically keeps the dependencies in my repository up to date. I think of it like a diligent assistant that opens a pull request every time a library I use gets a new version — no more poking package managers by hand once a week. It's similar to how I use `git` to track code changes, except Dependabot tracks the *packages* my code depends on, and it can also spot security problems in them.

## What does it do?

It watches the manifest files in my repo (like `package.json`, `requirements.txt`, or `go.mod`), checks the upstream registries for newer versions, and opens a pull request when one is available. Those PRs can be configured to bump patch versions automatically and to group unrelated updates together. It also scans dependencies for known vulnerabilities and opens separate, higher-priority pull requests to fix them.

## Why does it exist?

Before Dependabot, keeping dependencies fresh meant setting a calendar reminder, running `npm outdated`, and opening the PRs myself. On a small project that's annoying; on a team it's a recurring chore that gets skipped, which is exactly how old, vulnerable packages accumulate. Dependabot solves this by making dependency updates a continuous, automated process instead of a manual one. Maintainers use it to reduce the risk of shipping outdated code without having to think about it every day.

## Key terminology

- **Version updates** — Dependabot's job of checking package registries for newer releases and opening PRs to bump them. Example: a PR titled "Bump lodash from 4.17.21 to 4.17.22".
- **Security updates** — a separate mode that detects known vulnerabilities in a dependency and opens a PR to upgrade to a patched version, usually prioritized over ordinary version bumps.
- **Pull request (PR)** — the deliverable Dependabot produces. Each update arrives as a mergeable PR that I can review, test, and merge like any other.
- **Schedule** — the cadence (weekly, monthly, or on a custom day) at which Dependabot checks for updates. Example: `interval: weekly` means it looks once a week.
- **Grouped updates** — a setting that bundles several minor/patch bumps into a single PR instead of one PR per package, keeping review load low.
- **Ignore rules** — filters that tell Dependabot to stop opening PRs for a specific package, a version range, or a dependency tree, useful when a package is deprecated or intentionally pinned.
- **Alerts** — GitHub security notifications that fire when a vulnerable dependency is detected, visible in the repository's Dependabot tab.

## A tiny example

```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
```

This file tells Dependabot to manage the npm dependencies in my repo's root, checking for updates once a week.

## What I'll cover next

Next I want to walk through a real Dependabot config, enable security updates, and see what the alert and PR experience actually looks like from inside the repository UI.