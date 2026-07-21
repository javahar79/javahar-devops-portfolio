---
last_verified: 2026-07-21
tool_version: n/a
---

# Git & Version Control — quick primer

> First-day notes on Git & Version Control. What it is, why it matters, and the key ideas to know.

## What is it?

Version control is the practice of recording changes to files over time so I can recall specific versions later. Git is the most widely used version control system, but the concept is older than Git itself — it's the idea of maintaining a complete history of changes, not just the latest file. Think of it like a time machine for my work: I can see who changed what, when, and why, and I can jump back to any point if something breaks.

## Why does it matter for DevOps?

Every DevOps workflow depends on version control. Infrastructure configs, deployment scripts, Dockerfiles, and pipeline definitions all live in Git. Without it, I can't audit what changed in a deploy, roll back a bad release, or collaborate with teammates on the same files. Git is also the trigger for CI/CD — every pipeline starts with a commit. On-call rotations depend on Git history to figure out what broke and when. Understanding version control means I understand the backbone of the entire DevOps workflow, from local development to automated deployment.

## Key terminology

- **Repository** — A directory tracked by a version control system, containing the full history of every file. Example: my `infra/` repo holds all Terraform and Ansible files.
- **Commit** — A snapshot of changes with a message describing what changed. Example: `"Add nginx config for staging"` explains why the file changed.
- **Branch** — An independent line of development that lets me work on something without affecting the main line. Example: `feature/add-auth` for a new login system.
- **Merge** — Combining changes from one branch into another. Example: merging `feature/add-auth` into `main` after review.
- **Remote** — A version of the repository hosted on another machine, usually GitHub or GitLab. Example: `origin` is the default name for the remote.
- **Clone** — Copying a remote repository to my local machine so I can work on it. Example: `git clone https://github.com/org/repo.git`.
- **Pull** — Fetching changes from a remote and merging them into my local branch. Example: `git pull origin main` before starting new work.
- **Push** — Sending my local commits to a remote repository. Example: `git push origin feature/add-auth`.
- **Staging area** — A place to prepare changes before committing them. Example: `git add file.txt` stages it for the next commit.
- **Conflict** — When two people change the same part of a file and Git can't auto-merge. Example: I edit line 10 while a teammate deletes it.

## A concrete example

```bash
# Start a new project and track it with Git
mkdir web-app && cd web-app
git init

echo "server { listen 80; }" > nginx.conf
git add nginx.conf
git commit -m "Add initial nginx config"

git checkout -b feature/add-ssl
echo "server { listen 443 ssl; }" > nginx.conf
git add nginx.conf
git commit -m "Add SSL config"

git checkout main
git merge feature/add-ssl
```

This demonstrates the core version control loop: create a file, commit it, branch off to try a change, then merge it back. It shows why version control matters — I can experiment on a branch without breaking the main config, and I always have a history to fall back on.

## How this connects to what's next

Once I understand version control, the next step is GitHub for remote hosting and collaboration, then GitHub Actions to automate testing and deployment every time I commit. From there, infrastructure as code tools like Terraform and Ansible also live in Git, making version control the thread that connects every DevOps tool I'll learn. Even container images and Kubernetes manifests are typically versioned and deployed through GitOps workflows, so this concept stays relevant all the way up to advanced platform engineering.
