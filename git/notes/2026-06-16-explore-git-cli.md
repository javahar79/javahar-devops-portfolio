# 2026-06-16 — poking around the Git CLI

I ran `git help` to see what commands are available. There are more than I expected.

The ones I want to try next:
- `git log` — shows commit history
- `git diff` — shows what changed between commits
- `git status` — tells me what's going on in the repo right now
- `git branch` — lists branches

I ran `git status` in the demo repo and it said "nothing to commit, working tree clean". Good.

Tried `git log` — it showed my single commit with author and date. The output goes through `less`, so I had to press `q` to quit.

`git diff` with nothing staged returns nothing. I'll test it after editing a file.

Discovered `git stash` exists — lets me temporarily put aside changes without committing. Sounds useful for when I'm in the middle of something but need to switch branches.
