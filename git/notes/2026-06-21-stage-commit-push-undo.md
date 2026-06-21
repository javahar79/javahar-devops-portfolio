# 2026-06-21 — undo, stage, commit, and push: what I learned from the tutorial

I worked through Git tutorials on the basic workflow and the undo commands. Here's what I learned.

## The core workflow

```
edit files → git add → git commit → git push
```

Three committed files in the staging area before push makes the most sense to me now. `git add` stages specific changes, `git commit` saves the snapshot locally, `git push` sends it to the remote.

One thing I didn't expect: `git add` can take a directory path to stage everything in it. I started out adding one file at a time, which is tedious.

## Undoing things — more commands than I expected

There are at least four ways to "undo" in Git, and they do different things:

### `git restore` — unstage or discard working-tree changes
- `git restore --staged <file>` — unstage a file I already `git add`-ed, but keep the changes in my working directory.
- `git restore <file>` — discard uncommitted changes entirely. Careful — there's no undo for this.

### `git reset` — move the branch pointer
- `git reset --soft HEAD~1` — undo the last commit but keep the changes staged. I used this when my commit message had a typo.
- `git reset --mixed HEAD~1` — undo the last commit and unstage the changes (default mode).
- I didn't try `--hard` yet — it sounds dangerous for a beginner.

### `git commit --amend` — fix the last commit
I made a commit and immediately realized I forgot to include a file. Instead of making a new commit, I staged the missing file and ran `git commit --amend`. It replaced the previous commit with one that includes both. Clean history. This only works if I haven't pushed yet.

### `git revert` — safe undo for pushed commits
The tutorial recommended `git revert` instead of `git reset` when the commit is already pushed. It creates a new commit that undoes the changes — no history rewriting. I tried this and it felt safer than the alternatives.

## What I'd try next
I want to test `git stash` — saving work-in-progress without committing — and practice branch-based workflows like `git merge` and `git rebase`.
