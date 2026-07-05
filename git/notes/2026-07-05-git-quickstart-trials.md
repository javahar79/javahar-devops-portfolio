---
last_verified: 2026-07-05
tool_version: n/a
---

# Git Quickstart — What Tripped Me Up

Following the official Git quickstart was mostly smooth, but a few things caught me off guard. I went through the "Hello World" exercise on GitHub's docs — create a repo, clone it, add a file, commit, push, and make a pull request.

## Setting up

The quickstart has you create a repo on GitHub, clone it, add a file, commit, and push. Straightforward overall. What got me:

- **HTTPS vs SSH:** The quickstart defaults to HTTPS clone URLs. I'd already set up an SSH key and was using it for other repos, so I had to figure out which clone URL to use. The page does have a toggle for SSH, but I missed it on first glance because it's small and tucked above the URL box.
- **Global config first:** `git config --global user.name` and `user.email` need to be set before your first commit. The quickstart shows these lines, but they're easy to gloss over. When I skipped them, my first commit gave me a scary-looking error asking me to "tell git who you are." Had to look up the fix.

## The master vs main thing

GitHub now defaults new repos to `main` as the branch name. But when I tested `git init` locally (instead of cloning), it still created a `master` branch. Pushing to `origin main` failed because my local branch was called `master`. I had to run `git branch -M main` to rename it before the push would work. This is a common gotcha mentioned in the docs, but it's easy to forget when you're going through the motions.

## The -u flag

The quickstart uses `git push -u origin main` on the first push. On my second try at the exercise, I left off the `-u` flag. My push went through — but then the next `git push` failed with "The current branch main has no upstream branch." The error message helpfully tells you `git push --set-upstream origin main` to fix it. Once you know, you know.

## What I'd try next

Next time I'd go through the GitHub CLI (`gh repo create`) workflow instead, since it handles remote setup automatically. I also want to practice branch workflows and merge conflicts on purpose — the quickstart's single-branch flow doesn't prepare you for real collaboration.
