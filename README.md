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

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile.

---

## Quick links

- [Inspecting Pods, Services, and Events (2026-07-12)](kubernetes/docs/2026-07-12-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
- [First Local File Resource (2026-07-12)](terraform/configs/2026-07-12-first-local-file-resource.hcl) — Minimal Terraform config with `local_file` resource
- [Install Terraform and Run Version (2026-07-12)](terraform/notes/2026-07-12-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Minimal Deployment + Service (2026-07-10)](kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install scripts, Dockerfiles, compose config |
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
| Docker | 18 | 15 | 1 | 15 | — | — | 2026-07-09 |
| Git | 4 | 2 | — | — | — | — | 2026-07-09 |
| GitHub Actions | 3 | — | 2 | — | — | 1 | 2026-07-10 |
| Kubernetes | 3 | 1 | — | — | 1 | 1 | 2026-07-12 |
| Terraform | 2 | 1 | 2 | — | — | — | 2026-07-12 |

---

## Status

Actively building out first-contact notes and runnable configs. Recent additions cover Kubernetes pod/service/event inspection, Terraform install notes and local file config, and workflow debugging docs.

---

_Last updated: 2026-07-12_
