---
last_verified: 2026-08-17
tool_version: n/a
---

# Install Git and run my first commit workflow

> Scratch notes from my first real session: got Git on the machine, made a repo, and walked the add → commit → log loop end to end.

## What I did

Checked Git was there first with `git --version`. It was. Then I made a scratch folder, `git init`'d it, wrote a small file, and tried my first commit. Hit my first snag here — `git commit` refused because I hadn't told it who I am. Fix was two `git config` lines for `user.name` and `user.email`.

After that the loop worked:

```bash
git init
git add notes.md
git commit -m "first commit"
git log --oneline
```

`git add` staged the file, `git commit` saved it, and `git log --oneline` showed my one line of history. The `git status` between each step was the helpful part — it kept telling me what was staged vs unstaged.

## Got stuck on

- **Identity check:** `git commit` errors with "Please tell me who you are" until `user.name`/`user.email` are set. Easy fix, confusing error the first time.
- **Staging vs saving:** I expected `git commit` to grab everything, but it only commits what's staged. `git status` shows exactly what's staged vs not — I learned to read it before every commit.

## What I'd try next

Branching. I want to see how a `feature` branch keeps commits off `main`, and practice the merge back — that's the part I keep seeing in team workflows.
