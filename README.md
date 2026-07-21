# javahar-devops-portfolio
> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)
![License](https://img.shields.io/github/license/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker (59 files), Git (13), GitHub Actions (12), Kubernetes (12), and Terraform (13) — plus cross-cutting concept primers in CI/CD, Git & version control, Linux OS fundamentals, and networking. Each tool has a primer, dated CLI walkthrough notes, Dockerfiles, scripts, and config files accumulated through hands-on practice.

---

## Quick links

- [GHA Quickstart — What Tripped Me Up (2026-07-21)](github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — Workflow syntax, triggers, and debugging gotchas
- [Minimal Deployment + Service (2026-07-21)](kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml) — Deploy nginx with a ClusterIP Service
- [Troubleshoot Failing Deployments (2026-07-21)](kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh) — Diagnose CrashLoopBackOff and ImagePullBackOff
- [Debugging Port-Forward, Exec, and Logs (2026-07-21)](kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh) — Port-forward, exec into pods, and tail logs
- [Validate Workflow Runs with gh CLI (2026-07-21)](github-actions/scripts/2026-07-21-validate-workflow-runs.sh) — Validate GHA workflows from the command line

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI walkthrough notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration notes, undo/stage/commit workflow, branch/merge/revert script, reflog/rebase snippet |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation script |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes |
| `docs/` | Cross-cutting concept primers (CI/CD, Git & version control, Linux fundamentals, networking) |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Release notes and change log |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Source | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|--------|---------------|
| Docker | 20 | 18 | 1 | 18 | — | — | — | 2 | 2026-07-18 |
| Git | 7 | 6 | — | — | — | — | — | — | 2026-07-20 |
| GitHub Actions | 4 | 1 | 5 | — | — | 2 | — | — | 2026-07-21 |
| Kubernetes | 4 | 3 | — | — | 2 | 2 | 1 | — | 2026-07-21 |
| Terraform | 8 | 1 | 4 | — | — | — | — | — | 2026-07-19 |

---

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include GHA workflow validation scripts, K8s troubleshooting scripts and debugging snippets, a new minimal K8s Deployment manifest, and GHA quickstart notes (all 2026-07-21). Docker L2 content and tagged non-root Dockerfiles remain the deepest category.

---

_Last updated: 2026-07-21_
