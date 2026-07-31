---
last_verified: 2026-07-30
tool_version: n/a
---

# Git merge vs git rebase: comparing two approaches for integrating changes

> Both `git merge` and `git rebase` integrate changes from one branch into another, but they do it differently — merge creates a new merge commit that ties the histories together, while rebase replays commits on top of the target branch. Which one to use depends on whether you value a faithful history or a linear one.

## Purpose

When a feature branch has fallen behind `main`, there are two ways to bring it up to date. `git merge` preserves the exact topology of both branches and records a merge commit; `git rebase` rewrites the feature branch's commits so they appear to have been written on top of the latest `main`. This doc outlines the mechanics, trade-offs, and when each approach is appropriate.

## How merge works

`git merge` takes the tips of two branches and produces a new merge commit that references both parents. The existing commit history of the feature branch is untouched.

```bash
git checkout feature/login
git merge main
```

This creates a merge commit on `feature/login` whose first parent is the previous tip of `feature/login` and whose second parent is the tip of `main`. The history graph shows a diamond shape — the feature branch diverges from `main`, accumulates commits, then rejoins.

The key property is that **no existing commit is rewritten**. Anyone who has based work on those commits will not see their history shift. This makes merge safe to use on any shared branch.

## How rebase works

`git rebase` replays each commit from the feature branch on top of the target branch. Instead of a merge commit, the feature branch's commits are re-created with new hashes at the tip of `main`.

```bash
git checkout feature/login
git rebase main
```

After the rebase, `feature/login` points to a completely new chain of commits. The old commits still exist (reachable via `git reflog` for a while) but are no longer on the branch.

The key property is a **linear history** — the log reads as if all commits were written sequentially on top of `main`. However, **existing commits are rewritten**, so anyone else working on the same branch will need to re-sync.

## When to use merge

Merge is the safer default for any branch that is shared with other developers. Because it never rewrites history, collaborators can pull and continue working without intervention. It is the standard choice for integrating a completed feature branch into `main` via a pull request.

Merge is also preferred when you want to preserve the exact context of when and why a branch was created — the merge commit carries that information in the graph.

## When to use rebase

Rebase is appropriate for keeping a feature branch up to date with `main` during development. Running `git rebase main` periodically while a feature branch is still private keeps the history clean and makes `git bisect` more effective (each commit is tested against the latest `main`).

Rebase is also used with `git rebase -i` to clean up commit history before merging — squashing "fix typo" commits, reordering, or rewriting messages. This is typically done on commits that have not yet been shared.

## Steps

### Merge

```bash
# On the feature branch, integrate main:
git checkout feature/login
git fetch origin
git merge main
```

If conflicts arise, resolve them in the affected files, then:

```bash
git add .
git commit   # completes the merge commit
```

### Rebase

```bash
# On the feature branch, replay commits onto latest main:
git checkout feature/login
git fetch origin
git rebase main
```

If conflicts arise during the rebase, Git pauses at the conflicting commit. Resolve the conflict, then:

```bash
git add .
git rebase --continue
```

To abort the rebase and return to the pre-rebase state:

```bash
git rebase --abort
```

## Verify

After either operation, confirm the result:

```bash
git log --oneline --graph --all -10
```

For merge, you should see a diamond shape with a merge commit. For rebase, the feature branch commits should appear linearly on top of `main`.

To confirm no conflicts remain:

```bash
git diff main..feature/login --stat
```

## Common errors

The most common mistake is rebasing commits that have already been pushed to a shared repository. After a rebase, the old and new commits have different hashes, so `git push` will be rejected. The fix is `git push --force-with-lease`, but this should only be done when you are certain no one else is working on the same branch.

A second common issue is conflicts during rebase that are harder to resolve than during merge. Because rebase replays commits one at a time, you may need to resolve the same conflict multiple times if several commits touch the same lines.

## What I'd try next

- Practice `git rebase -i` to squash and reorder commits before merging a feature branch
- Try `git merge --no-ff` to force a merge commit even when fast-forward is possible, preserving branch context in the graph
