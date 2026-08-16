---
last_verified: 2026-08-16
tool_version: n/a
---

# Branching convention

## Branch types

| Prefix | Purpose | Example |
|--------|---------|---------|
| `main` | Production-ready code, always deployable | `main` |
| `develop` | Integration branch for the next release | `develop` |
| `feature/` | New features or enhancements | `feature/add-oauth-login` |
| `release/` | Release preparation and bug fixes | `release/2026-08-16-v1.2` |
| `hotfix/` | Urgent production fixes | `hotfix/patch-crlf-injection` |
| `bugfix/` | Non-urgent bug fixes | `bugfix/fix-navbar-overflow` |

## Naming rules

- All branches except `main` and `develop` must use a prefix followed by a slash and a kebab-case description.
- Descriptions should be concise (2–4 words) and use lowercase kebab-case.
- Avoid generic names like `feature/test` or `fix/stuff`.

## Workflow

1. Create a branch from `develop` for new work: `git checkout -b feature/my-change develop`.
2. Commit locally and push to remote: `git push -u origin feature/my-change`.
3. Open a pull request against `develop`.
4. After review and CI pass, merge via the GitHub UI or `git merge --no-ff`.
5. Delete the feature branch after merge.
