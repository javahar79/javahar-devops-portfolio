#!/bin/bash
# last_verified: 2026-07-09 · git n/a
#
# Working through branch, merge, and revert — first real Git workflow practice

# sandbox directory so I don't mess up anything real
SANDBOX="/tmp/git-workflow-$(date +%s)"
mkdir -p "$SANDBOX"
cd "$SANDBOX" || exit 1

git init
git config user.name "Dev Learner"
git config user.email "learner@example.com"

echo "# Demo" > README.md
git add README.md
git commit -m "first commit on main"

# create a feature branch to work separately
git checkout -b feature/add-greeting

echo "Hello from the feature branch" > greeting.txt
git add greeting.txt
git commit -m "add greeting.txt on feature branch"

# switch back to main and make a different change
git checkout main

echo "log.txt" > .gitignore
git add .gitignore
git commit -m "add gitignore on main"

# merge the feature branch back — git creates a merge commit here
git merge feature/add-greeting -m "merge feature/add-greeting into main"

# realized I merged too early — revert the merge commit
# git revert needs the merge's parent to know which side to keep
git revert --no-edit HEAD

echo "Done. Sandbox at $SANDBOX"
echo "Run 'ls $SANDBOX' and 'git -C $SANDBOX log --oneline' to inspect."
