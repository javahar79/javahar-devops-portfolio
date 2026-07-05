---
last_verified: 2026-07-05
tool_version: n/a
---

# Undo, Stage, Commit, and Push — What I Learned from the Tutorial

I went through a Git workflow tutorial that focused on the edit-stage-commit-push cycle and how to undo at each step. Here's what I picked up.

## Staging is not as simple as I thought

I used to just `git add .` and hope for the best. The tutorial showed staging as a selective step — you can stage parts of a file with `git add -p` (patch mode), which walks through each change chunk and asks if you want to stage it. That was new to me. It means you can split a messy file's changes into multiple clean commits without rewriting.

## Undoing at each stage

The tutorial broke down undo commands by where you are in the workflow:

- **Before staging:** `git checkout -- <file>` restores the working copy. But the tutorial pointed out that `git restore <file>` is the modern way in newer Git versions.
- **After staging but before commit:** `git reset HEAD <file>` unstages it. The newer form is `git restore --staged <file>`.
- **After commit but before push:** `git commit --amend` lets you fix the last commit message or add more changes.
- **After push:** `git revert <commit>` creates a new commit that undoes the old one. The tutorial emphasized that you should never `git reset` something you've already pushed, because rewriting public history breaks collaboration.

## What tripped me up

- **`git restore` vs `git reset` vs `git revert`:** The three commands all undo things differently, and the names don't make it obvious. `restore` works on files, `reset` moves the branch pointer, `revert` creates a new commit. I had to draw a small diagram to keep them straight.
- **`--amend` after pushing:** I tried `git commit --amend` after already pushing, then `git push` failed because the histories diverged. Needed `git push --force-with-lease` to fix it. The tutorial warned about this, but I had to feel the pain to remember it.

## What I'd try next

I want to practice `git rebase -i` for squashing commits and `git reflog` for recovering from rebase mistakes. Those feel like the next step beyond basic undo.
