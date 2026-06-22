# Git quickstart — what tripped me up

Worked through the official Git quickstart to get comfortable with the basics. I already knew some Git, but the tutorial filled in gaps — especially around remotes and reset.

## Steps I followed

1. Ran `git init` in a test directory to start a fresh repo.
2. Created a `README.md`, did `git add README.md` then `git commit -m "initial commit"`.
3. Connected to a remote: `git remote add origin <url>` and `git push -u origin main`.
4. Tried branching: `git checkout -b feature-branch`, made changes, committed, switched back to `main` with `git checkout main`.
5. Merged the branch with `git merge feature-branch`.

## Where I got stuck

**`git push` without `-u`.** First push to a new remote branch failed because there was no tracking reference. The error message is pretty clear — tells you exactly what to run — so not a real blocker, but I'd forgotten the `-u` flag exists.

**Default branch name.** On my system `git init` created a `master` branch, but the tutorial assumed `main`. I had to rename with `git branch -m master main` to follow along. Not a big deal but threw me for a second.

**Merge conflicts.** The tutorial's merge example was too clean — both branches touched different files. I went out of my way to cause a real conflict (edited the same line in both branches), and resolving it in the editor was more manual than I expected. `git status` showed which files were conflicted, and I had to edit the `<<<<<<<`, `=======`, `>>>>>>>` markers by hand. Felt primitive but I get why it works that way.

**`git log` is overwhelming without flags.** Plain `git log` shows everything with full hashes and dates. `git log --oneline --graph --all` is way more useful for seeing the branch topology.

## What I'd try next

I want to explore `git rebase` vs `merge` — the tutorial mentioned it but didn't go deep. Also `git stash` for saving work-in-progress without committing.
