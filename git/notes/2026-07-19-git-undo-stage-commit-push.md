---
last_verified: 2026-07-19
tool_version: n/a
---

# Undo, stage, commit, and push: what I learned from the tutorial

I worked through the Git basics tutorial, focusing on the undo/stage/commit/push loop. Here's what clicked and what didn't.

## Staging

`git add` stages changes but doesn't commit them. I kept forgetting to check `git status` first — ended up staging files I didn't mean to. Running `git status` before every add is now a reflex.

I also learned about `git add -p` which stages file parts interactively. That saved me once when I had debug prints and real changes in the same file and only wanted to commit the real ones.

## Undoing

I messed up a few times on purpose to practice recovery:

- `git restore --staged <file>` unstages without losing changes. Used this when I accidentally staged a config file with my API key in it.
- `git restore <file>` discards uncommitted changes. Scary but useful when I really broke a file and wanted a clean slate.
- `git commit --amend` fixed a typo in my last commit message without adding a new commit. Felt like magic but the tutorial warned me not to use it on pushed commits.

## Committing

I learned to write meaningful commit messages. `git commit -m "fix typo in README"` is way better than `git commit -m "update"`. Tried writing multi-line messages too with just `git commit` (no `-m`) — the editor opens and I can write a short subject line, blank line, then body.

## Pushing

`git push origin main` sent my commits up. First time I got a rejection because I hadn't pulled first — `git pull --rebase` sorted it without creating a merge commit. That felt cleaner than a plain `git pull`.

Pushing to a branch I'd never pushed before needed `git push -u origin <branch>` to set the upstream. Forgot that once and got a confusing error.

## What I'd try next

I want to practice `git revert` vs `git reset` to understand the difference between safe and destructive undo. I also want to try working with branches in a small team simulation — create a feature branch, push it, open a PR, then merge.
