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

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, Dockerfile, or deployment manifest.

---

## Quick links

- [Reading Workflow Logs and Debugging (2026-07-10)](github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — Step-by-step log reading and debugging for failed workflow runs
- [Minimal Deployment + Service Manifest (2026-07-10)](kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml) — Basic Kubernetes Deployment and Service manifest
- [Kubernetes Quickstart — What Tripped Me Up (2026-07-10)](kubernetes/notes/2026-07-10-k8s-quickstart-trials.md) — Official K8s quickstart gotchas and lessons learned
- [Tagged Non-Root Dockerfile (2026-07-09)](docker/dockerfiles/2026-07-09-tagged-nonroot.Dockerfile) — Minimal Alpine multi-stage build with pinned tag and non-root runtime
- [First Container Port Map Script (2026-07-09)](docker/scripts/2026-07-09-first-container-port-map.sh) — Build and run Alpine container with port 8082 mapping

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, branch/merge/revert script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, quickstart trials, debugging docs |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script, deployment manifests |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Project changelog and release history |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Docs | Manifests | Last verified |
|------|-------|---------|---------|-------------|------|-----------|---------------|
| Docker | 18 | 15 | 1 | 15 | — | — | 2026-07-09 |
| Git | 4 | 2 | — | — | — | — | 2026-07-09 |
| GitHub Actions | 3 | — | 2 | — | 1 | — | 2026-07-10 |
| Kubernetes | 3 | 1 | — | — | — | 1 | 2026-07-10 |
| Terraform | 1 | 1 | 1 | — | — | — | — |

---

## Status

Actively building out first-contact notes and runnable configs. Recent additions cover GitHub Actions debugging, Kubernetes quickstart trials and deployment manifests, and Docker non-root tagged builds.

---

_Last updated: 2026-07-12_
