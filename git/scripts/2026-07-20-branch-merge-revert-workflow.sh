#!/bin/bash
# last_verified: 2026-07-20 · git n/a
# L2 — practicing branch, merge, and revert in an isolated sandbox

# Set up a disposable sandbox so nothing in my actual repos gets touched
SANDBOX="/tmp/git-workflow-$(date +%s)"
mkdir -p "$SANDBOX"
cd "$SANDBOX" || exit 1

# Initialize a tiny repo with one file on main
git init
git config user.name "Dev Learner"
git config user.email "learner@example.com"
echo "# Demo" > README.md
git add README.md
git commit -m "first commit on main"

# Create a feature branch. I used `git switch -c` here instead of `git checkout -b`
# because the docs say it's clearer about intent — checkout switches branches,
# restores files, and inspects history all at once, which caused me to accidentally
# discard changes a few times when I meant to just change branches [source: https://tech-insider.org/git-tutorial-complete-beginner-advanced-2026]
git switch -c feature/add-greeting

echo "Hello from the feature branch" > greeting.txt
git add greeting.txt
git commit -m "add greeting.txt on feature branch"

# Switch back to main and make an unrelated change
git switch main

echo "log.txt" > .gitignore
git add .gitignore
git commit -m "add gitignore on main"

# Merge the feature branch back — git creates a merge commit here
git merge feature/add-greeting -m "merge feature/add-greeting into main"

# Realized I merged too early. Reverting a merge commit is trickier than a regular
# commit because git revert needs to know which parent to keep as the mainline.
# --no-edit skips the commit-message editor so the script stays non-interactive.
git revert --no-edit HEAD

echo "Done. Sandbox at $SANDBOX"
echo "Run 'git -C $SANDBOX log --oneline --graph' to inspect the history."
