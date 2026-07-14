# javahar-devops-portfolio

> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, Dockerfiles, scripts, and config files for hands-on practice.

---

## Quick links

- [Tagged Non-Root Dockerfile (2026-07-12)](docker/dockerfiles/2026-07-12-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Minimal CI Workflow (2026-07-12)](github-actions/configs/2026-07-12-minimal-ci-workflow.yaml) — GitHub Actions CI workflow with trigger and job setup
- [Run Container Port Map Script (2026-07-12)](docker/scripts/2026-07-12-run-container-port-map.sh) — Build and run Go container with port 8084 mapping
- [Install Terraform and Run Version (2026-07-12)](terraform/notes/2026-07-12-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Inspecting Pods, Services, and Events (2026-07-12)](kubernetes/docs/2026-07-12-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, branch/merge/revert script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, quickstart trials, workflow debugging docs |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script, K8s manifests, pod/service/event docs |
| `terraform/` | Terraform primer, install script, local provider config, local file resource config |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Project changelog and release history |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Last verified |
|------|-------|---------|---------|-------------|-----------|------|---------------|
| Docker | 18 | 16 | 1 | 18 | — | — | 2026-07-12 |
| Git | 4 | 2 | — | — | — | — | 2026-07-09 |
| GitHub Actions | 3 | — | 3 | — | — | 1 | 2026-07-12 |
| Kubernetes | 3 | 1 | — | — | 1 | 1 | 2026-07-12 |
| Terraform | 2 | 1 | 2 | — | — | — | 2026-07-12 |

---

## Status

Actively building out first-contact notes and runnable configs. Recent additions cover a tagged non-root Dockerfile, a new CI workflow config, and a Go port-map script (2026-07-12).

---

_Last updated: 2026-07-14_
