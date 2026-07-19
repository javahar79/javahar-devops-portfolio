---
last_verified: 2026-07-19
tool_version: "2.47"
sources: []
---

# Following the official Git quickstart — what tripped me up

I followed the Git quickstart on git-scm.com. Created a repo, made some commits, pushed to a remote. Here's where I got stuck.

## Setting up the repo

`git init` was fine, then `git add README.md` and `git commit -m "first commit"` worked first try. But when I tried `git push`, it failed — I hadn't added a remote yet. Got `fatal: No configured push destination`. Fixed with `git remote add origin <url>`. Then `git push -u origin main` worked — the `-u` flag set the upstream so future pushes are just `git push`.

## Branching confusion

The quickstart showed `git branch -M main` to rename the default branch from `master`. I ran it but nothing seemed to happen. Turns out it just renamed the branch silently — `git branch` showed `main` was now there and `master` was gone. I expected more feedback. Later I ran `git branch -a` and was confused that the remote still showed `master` until I pushed `main`.

## The staging area

`git add` took me a while to internalise. I kept forgetting to stage before committing. I'd edit a file, run `git commit` and Git would say "nothing to commit". A few times I committed without staging the most recent change — the commit only included what was staged before my latest edit. Getting into the habit of `git status` before committing helped. `git diff --staged` became my go-to for checking what would actually go in.

## Figuring out git log

The quickstart mentioned `git log` but I didn't appreciate how much output it dumps for even a small repo. The default format is wordy. `git log --oneline --graph` gave me a much cleaner view of the commit history. I also tripped on `git log` not showing anything after a fresh clone — the log is empty until you `cd` into the repo directory.

## What I'd try next

I want to practice reverting commits with `git revert` and see how it differs from `git reset`. Also need to get comfortable with rebasing — the quickstart mentioned it but I wasn't ready for it yet.
