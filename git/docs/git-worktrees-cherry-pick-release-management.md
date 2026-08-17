---
last_verified: 2026-08-17
tool_version: n/a
---

# Git worktrees and cherry-pick: release-management integration patterns

> Two git features that show up constantly in release management: worktrees for keeping several branches checked out at once, and cherry-pick for moving a single fix between branches. Together they make patch-hotfix workflows much easier to run.

## Purpose

Release management usually means juggling more than one branch at a time — a `main` line where feature work lands, and one or more release branches that carry shipped versions. Two git features exist specifically for this:

- **Worktrees** let you check out multiple branches of the same repository into separate directories on disk, so you don't have to stash work-in-progress, switch branches, and switch back every time a hotfix lands.
- **Cherry-pick** lets you take a single commit (or a range) that landed on one branch and apply it onto another branch — the standard way to port a bug fix from `main` onto a release branch without merging the whole history.

The release-management pattern these enable: keep working on `main`, and when a fix is needed on an older release, lift just that one commit across.

## Worktrees

A worktree is a separate working directory linked to the same repository. The main checkout lives where the repo was cloned; every `git worktree add` creates an additional directory with its own checked-out branch and its own index.

```bash
git worktree add ../release-1.x release/1.x
git worktree list
```

The branch you add must not be checked out anywhere else — each branch can have only one worktree at a time. This is the main constraint to remember; trying to add a branch that's already checked out fails immediately.

To stop working on a worktree, remove it:

```bash
git worktree remove ../release-1.x
```

Worktrees are stored in `.git/worktrees/`, and a worktree that was left around after a directory was deleted can be pruned with `git worktree prune`.

## Cherry-pick

Cherry-pick applies the changes from an existing commit onto the current branch as a brand-new commit:

```bash
git checkout release/1.x
git cherry-pick <commit-hash>
```

The replayed commit has a new hash but keeps the original author and message. If the changes don't apply cleanly, git stops and asks you to resolve conflicts, then continue:

```bash
git add <resolved-file>
git cherry-pick --continue
```

If the pick goes sideways and you want to abandon it entirely, `git cherry-pick --abort` returns you to the state before the command.

A whole range can be moved with `git cherry-pick <start>..<end>` (exclusive of the start commit), though single commits are the common case in release work.

## Steps — hotfix from main onto a release branch

1. Create a worktree for the release branch so `main` stays checked out and untouched:
   ```bash
   git worktree add ../release-1.x release/1.x
   ```
2. From `main`, note the hash of the fix commit you want to port:
   ```bash
   git log --oneline -5
   ```
3. In the release worktree, apply the commit:
   ```bash
   cd ../release-1.x
   git cherry-pick <commit-hash>
   ```
4. Resolve any conflicts, then continue:
   ```bash
   git add .
   git cherry-pick --continue
   ```
5. Push the release branch:
   ```bash
   git push origin release/1.x
   ```
6. When done, remove the worktree:
   ```bash
   cd ..
   git worktree remove ../release-1.x
   ```

## Verify

- `git worktree list` shows one worktree per checked-out branch.
- On the release branch, `git log --oneline -3` includes the ported fix with a new hash.
- `git status` in each worktree is clean (nothing left half-merged).
- `git cherry-pick --continue` after resolution leaves no `CHERRY_PICK_HEAD` state; `git status` confirms the pick completed.

## Common errors

- **Branch already checked out:** adding a worktree for a branch that's open elsewhere fails immediately. Check `git worktree list` before adding.
- **Conflicts repeat:** a fix touching lines that changed on the release branch resolves differently than it did on `main`; the same logical conflict can need resolving per release branch.
- **Cherry-pick vs merge confusion:** cherry-pick copies a commit, it does not record a relationship between branches. For release work that's exactly the point; for syncing full branch state a merge is the right tool.

## What I'd try next

- Script the whole hotfix flow — worktree add, cherry-pick, push, worktree remove — into a reusable helper.
- Practice `git cherry-pick <start>..<end>` for backporting a small series of commits.
- Look at `git worktree lock` for worktrees that should not be pruned accidentally.
