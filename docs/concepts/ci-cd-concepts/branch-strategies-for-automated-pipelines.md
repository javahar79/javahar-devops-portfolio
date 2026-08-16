---
last_verified: 2026-08-16
tool_version: n/a
---

# Branch strategies for automated pipelines

## Purpose

Branch strategies sit at the intersection of CI/CD Concepts and Git & Version Control. They determine how code moves from a developer's local commit into an automated pipeline, which tests run at each stage, and how changes reach production. This doc explains the common branch models and how they map to pipeline stages.

## Why it matters

A pipeline is only as reliable as the events that trigger it. If the branch model is unclear, teams end up running production deploys on every feature branch, skipping tests on long-lived branches, or fighting merge conflicts that the pipeline could have caught earlier. A deliberate branch strategy makes the pipeline's behavior predictable and the team's release cadence visible.

## Key branch models

### Trunk-based development

Developers commit to a single main branch (sometimes called `main` or `trunk`). Feature branches are short-lived and merged back frequently. CI runs on every push to main, and releases are tagged. This model keeps the pipeline input small and reduces merge debt.

### GitHub Flow

A lightweight variant of trunk-based development. The main branch is always deployable. Every change lives in a topic branch, and a pull request is the only way to introduce code. CI runs on the PR, a human approves, and the merge triggers deployment.

### GitFlow

Defines long-lived branches for development, releases, and hotfixes alongside the main branch. Feature branches branch off `develop`, releases are prepared in `release/*`, and urgent fixes use `hotfix/*`. CI pipelines adapt by running different test suites on each branch type.

## Mapping branches to pipeline stages

| Branch event | Typical CI action | Typical CD gate |
|---|---|---|
| Push to feature branch | Lint, unit tests, build | None |
| Pull request opened | Integration tests, security scan | Approval reviews |
| Push to main | Full build, deploy to staging | Manual approval |
| Tag created | Build release artifacts | Deploy to production |

## Prerequisites

- A repository where the CI system can register webhooks or polling triggers
- Pipeline definitions in the repository (for example, workflow files or Jenkinsfile)
- Branch protection rules on the main branch so status checks and approvals are enforced before merge

## Steps

1. **Choose a branch model** that matches the team's release cadence. Trunk-based or GitHub Flow suit continuous deployment; GitFlow suits scheduled releases with longer stabilization windows.
2. **Configure pipeline triggers** to match the model. For trunk-based flows, the main branch is the deployment target. For GitFlow, create separate jobs or workflow files that respond to branch name patterns.
3. **Add gating checks** so that only passing builds advance. Branch protection rules enforce required status checks and review counts.
4. **Separate deploy environments** by branch or tag. Map main to staging and tags to production. Use manual approval jobs so that production promotion is never automatic.

## Verify

- Create a feature branch, push a commit, and confirm the pipeline runs lightweight checks.
- Open a pull request and confirm integration tests and required reviews block the merge until they pass.
- Merge to main and confirm the staging deployment job starts automatically.
- Create a tag and confirm the production deployment job runs and requires approval if configured.

## Common errors

- **Running full production deploys on every feature branch.** Feature branches do not need a complete production deploy job. Running it wastes compute and can exhaust concurrency limits.
- **Missing branch protection on main.** Without required status checks, a broken build can merge and reach staging or production before anyone notices.
- **Long-lived feature branches.** The longer a branch diverges from main, the more likely the merge will fail and the pipeline will surface conflicts late. Keep branches short-lived when possible.
- **Tagging the wrong commit.** If the tag does not point to the exact commit tested in CI, the production deploy is running untested code. Use immutable tags or pipeline-provided commit references to pin the source.

## How this connects to what's next

Branch strategies are the trigger surface for the rest of the kit. GitHub Actions workflows, ArgoCD syncs, Terraform plan-on-PR jobs, and Snyk security gates all read the same branch and tag events. The next step is to wire a real pipeline so that the branch model described here becomes visible in the repository's CI tab.
