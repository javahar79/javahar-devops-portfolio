---
last_verified: 2026-08-08
tool_version: n/a
---

# Install Git and log my first `git commit`

> First-day notes for installing Git and making my first commit. Personal voice, plain language.

## What is it?
Git is a version control system. It tracks changes to files so I can revisit any point in a project's history. I've heard people compare it to "save points" in a game, but for code.

## What does it do?
It lets me snapshot my work, compare changes over time, and collaborate with others without overwriting each other's files. Every commit is a saved state with a message explaining what changed.

## Why does it exist?
Before Git, teams emailed patches or used centralized systems that required constant server access. Git is distributed — every clone has the full history — so I can work offline and sync later.

## Key terminology
- **Repository** — The project folder Git tracks. Example: `git init` creates one in the current directory.
- **Commit** — A snapshot of the repo at a point in time. Example: `git commit -m "add README"` saves the current state.
- **Working tree** — The actual files on disk I'm editing. Example: changes here show up as `modified:` in `git status`.
- **Staging area** — A holding spot for changes I want to include in the next commit. Example: `git add notes.md` stages that file.
- **HEAD** — A pointer to the latest commit on the current branch. Example: `git log --oneline` shows commits reachable from HEAD.

## A tiny example
```bash
git init
git add .
git commit -m "first commit"
```

## What I'll cover next
I want to learn how to branch and merge so I can work on features without breaking the main line of development.
