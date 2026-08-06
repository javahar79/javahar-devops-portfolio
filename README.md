# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, GitHub Actions, Kubernetes, Terraform, and cross-cutting concepts — notes, snippets, runnable configs, and first-contact walkthroughs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, Terraform, and cross-cutting concepts. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across nine tool families — Docker (68 files), Git (17), GitHub Actions (16), Jenkins (3), Kubernetes (17), Terraform (22), TF (1), Ansible (3), and OpenTofu (2) — plus cross-cutting concept primers (24 files) in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice.

## Quick links

- [Jenkins Primer](jenkins/notes/0000-primer-jenkins.md) — First-contact notes for Jenkins setup and pipeline basics
- [Install Jenkins and Open Web UI](jenkins/notes/2026-08-06-install-jenkins-and-open-web-ui.md) — Install Jenkins locally and access the web UI
- [Run First Pipeline](jenkins/snippets/2026-08-06-run-first-pipeline.groovy) — Groovy snippet for a minimal Jenkins pipeline
- [Networking Exercises](docs/concepts/networking-basics/scripts/2026-08-05-networking-exercises.sh) — Hands-on networking exercises for IP, port, and DNS practice
- [First OpenTofu Resource](of/configs/2026-08-05-first-resource.hcl) — First Terraform-compatible OpenTofu resource configuration

## Layout

| Directory | Contents |
|-----------|----------|
| `ansible/` | Ansible primer, install notes, first-command playbook config |
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose config, docs, notebook |
| `docs/concepts/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts, snippets |
| `jenkins/` | Jenkins primer, install notes, first pipeline snippet |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs, snippets, notebook |
| `of/` | OpenTofu primer and first resource config |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `tf/` | Terraform state and modules interactive notebook |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|---------------|
| Docker | 20 | 21 | 1 | 22 | 1 | 2 | — | 1 | 2026-08-05 |
| Git | 7 | 7 | 1 | — | — | 1 | — | 1 | 2026-08-01 |
| GitHub Actions | 4 | 2 | 6 | — | — | 3 | 1 | — | 2026-08-01 |
| Jenkins | 2 | — | — | — | — | — | 1 | — | 2026-08-06 |
| Kubernetes | 4 | 4 | — | — | 4 | 3 | 1 | 1 | 2026-08-01 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | 2026-07-28 |
| TF | — | — | — | — | — | — | — | 1 | 2026-08-04 |
| Ansible | 2 | — | 1 | — | — | — | — | — | 2026-08-05 |
| OpenTofu | 1 | — | 1 | — | — | — | — | — | 2026-08-05 |

## Status

Actively building out first-contact notes and runnable configs across all nine tools. Recent additions include Jenkins primer and first pipeline snippet; OpenTofu first-resource config; networking exercises script; and continued expansion of Docker tagged non-root and multi-stage Dockerfiles and Terraform notes/configs.

---
_Last updated: 2026-08-06_