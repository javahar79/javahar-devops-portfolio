# Git — quick primer

> First-day notes for someone who's never used Git. Personal voice, plain language.

## What is it?
Git is a version control system that tracks changes to files over time. Think of it like "save points" in a game — you can go back to any point, see what changed, and who changed it.

## What does it do?
It lets me snapshot my files (commits), create separate lines of work (branches), and merge changes back together. I can also push my work to remote servers like GitHub so it's backed up and shareable.

## Why does it exist?
Before Git, teams copied files around — "can you send me the latest version?" Git gives everyone the same history and makes collaboration safe instead of a game of email tag.

## Key terminology
- **Repository (repo)** — A folder Git is watching. Contains all files and their full history.
- **Commit** — A snapshot of my files at a point in time. Like hitting "save" in a game.
- **Branch** — A separate line of work. I can try something risky without breaking the main code.
- **Stage (index)** — Where I prepare files before committing. `git add` puts files here.
- **Remote** — A copy of the repo on another computer (like GitHub). `git push` sends changes there.
- **Clone** — Downloading a repo from a remote to my machine for the first time.

## A tiny example
```bash
git init my-first-repo
cd my-first-repo
echo "# Hello Git" > README.md
git add README.md
git commit -m "first commit"
```
Creates a new repo, stages a file, and makes my first commit in four lines.

## What I'll cover next
Now that I know what Git is, I want to install it and make my first real commit. After that, I'll explore the CLI to see what else Git can do.
