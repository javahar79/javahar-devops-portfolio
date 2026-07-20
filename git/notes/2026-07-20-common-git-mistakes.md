---
last_verified: 2026-07-20
tool_version: "2.52"
sources:
  - https://tech-insider.org/git-tutorial-complete-beginner-advanced-2026
---

# Common Git mistakes that trip me up

I've been using Git for a few weeks now and I keep running into the same handful of mistakes. Here's what I hit and what I learned from fixing each one.

## Committing to the wrong branch

I've made changes, committed them, and only then realized I was still on `main` instead of a feature branch. The fix is `git switch -c feature/my-change` before I start coding, but old habits die hard. Now I run `git branch` right after `git init` on a new task to make sure I'm on the right branch.

## Committing secrets

I once committed a file with an API key in it. The key was in a `.env` file that I forgot to add to `.gitignore`. Even after removing it from the next commit, the key is still in the Git history. To actually remove it I need `git rm --cached` and a history-rewrite tool like BFG Repo-Cleaner. Now I add `.env`, `*.key`, and `credentials.json` to `.gitignore` before my first commit.

## Merge conflicts

My first merge conflict felt like the end of the world. Git dumped conflict markers into my file and I had no idea what to do. I learned to open the file, pick the lines I want to keep, delete the markers, then `git add` and `git commit`. For bigger conflicts I use `git mergetool`. The key insight is that the conflict is just text — Git isn't making a decision for me, it's asking me to choose.

## Force-pushing to a shared branch

I ran `git push --force` on a branch my teammate was also working on. Their commits disappeared from the remote. The fix is `git push --force-with-lease` instead — it only forces if nobody else has pushed since I last fetched. Much safer.

## Forgetting to pull before pushing

When I tried to push and got "rejected" because the remote had new commits, I panicked. `git pull --rebase` replays my local commits on top of the fetched branch and keeps history linear. Now I run `git pull --rebase` before every push.

## Detached HEAD

I checked out a specific commit hash to inspect it and suddenly `git branch` showed I was in "detached HEAD" state. Any commits I made there were orphaned. To get back I needed `git switch main` (or whatever branch I was on). The lesson: only check out branches, not commit hashes, unless I explicitly want a detached state.

## What I'd try next

I want to practice `git rebase -i` to clean up messy commit history before merging, and `git reflog` to recover from accidental resets. Both feel like superpowers once you know they exist.
