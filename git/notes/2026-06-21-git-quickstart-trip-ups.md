# 2026-06-21 — following the Git quickstart, what tripped me up

I followed the [official Git quickstart](https://docs.github.com/en/get-started/quickstart/set-up-git) to configure Git and make my first real push. Most of it went fine, but a few things caught me off guard.

## What worked
Setting up my name and email with `git config --global` was straightforward. Creating a repo with `git init`, adding files, and committing — all smooth. The quickstart is short and the examples run without errors if you follow them exactly.

## What tripped me up

### 1. `git push` requires authentication, not just a password
The quickstart says to push to GitHub, but when I ran `git push origin main`, it asked for a username and password. I typed my GitHub password and it failed. Turns out GitHub removed password auth over HTTPS years ago — you need a **personal access token** (classic or fine-grained). I had to stop and create one in GitHub Settings > Developer settings > Personal access tokens. The quickstart mentions this in a note, but I almost missed it.

### 2. The "origin" remote doesn't exist automatically
I assumed `git push` would just work after `git init`. Nope — I had to create the repo on GitHub first, then run:
```bash
git remote add origin https://github.com/javahar/demo-repo.git
git branch -M main
git push -u origin main
```
Without the remote, Git just says "fatal: no configured push destination." The quickstart does explain this, but the sequence matters — create the remote repo first, then link it.

### 3. Staging feels weird at first
I'm used to "save file = done." Git makes you `git add` before `git commit`. I kept forgetting to stage and then wondered why my commit was empty. `git status` is the fix — it tells you exactly what's staged and what's not.

### 4. `git pull` can overwrite local work if I'm not careful
The quickstart says to sync with `git pull`. I tried it and got a merge commit because my local branch had diverged. I should have pulled more often, or used `git pull --rebase` to keep history linear.

## What I'd try next
I want to practice `git reset` and `git revert` to recover from mistakes without panicking. Also need to get comfortable with branches — the quickstart only touches `main`.

---

**L2 note** — Following the official Git quickstart; this doc captures what worked and what broke so I don't hit the same walls again.
