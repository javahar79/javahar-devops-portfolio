---
last_verified: 2026-08-16
tool_version: n/a
---

# Project scaffold: Git branching convention with pre-commit hooks

## Purpose

A team-ready scaffold that codifies a Git branching model and enforces it with a client-side pre-commit hook. The hook rejects commits on protected branches and validates feature-branch names against the convention before the commit is recorded.

## When to use

Use this scaffold when onboarding a new repository or when an existing repo lacks branch discipline. It is appropriate for teams that want to prevent direct commits to `main`, enforce a consistent naming scheme for feature and hotfix branches, and catch violations locally before they reach the remote.

## Prerequisites

- Git 2.5+ (branch name retrieval via `git symbolic-ref`)
- Bash 4.0+ (regex matching in the hook)
- A repository where you can copy the scaffold into the root directory

## Steps

1. Copy the scaffold files into the repository root:
   ```bash
   cp -r git/templates/project-scaffold-git-branching/* .
   ```
2. Install the pre-commit hook:
   ```bash
   cp pre-commit .git/hooks/pre-commit
   chmod +x .git/hooks/pre-commit
   ```
3. Review `branching-convention.md` and adjust the regex patterns in `pre-commit` if your team uses a different prefix scheme.
4. Stage and commit the scaffold files so the convention is tracked in version control.

## Verify

1. Confirm the hook is executable: `ls -l .git/hooks/pre-commit` should show `-rwxr-xr-x`.
2. Try committing on `main`: the hook should reject the commit with an error message.
3. Create a valid feature branch: `git checkout -b feature/add-login`.
4. Make a change and commit: the hook should allow the commit.
5. Create an invalid branch: `git checkout -b bad-branch-name`.
6. Try to commit: the hook should reject it.

## Common errors

- **Hook not running**: The file in `.git/hooks/pre-commit` is not executable. Fix with `chmod +x .git/hooks/pre-commit`.
- **Regex too strict**: The default pattern only allows `feature/`, `release/`, `hotfix/`, and `bugfix/` prefixes. Adjust the `BRANCH_PATTERN` variable in `pre-commit` to match your team's convention.
- **Detached HEAD state**: `git symbolic-ref HEAD` returns nothing when the repo is in a detached HEAD state. The hook treats this as invalid and rejects the commit. Checkout a branch before committing.
