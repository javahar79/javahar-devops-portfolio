#!/bin/bash
# last_verified: 2026-07-10 · git n/a
#
# Trying branch, merge, and revert again — this time with fast-forward vs
# no-ff merge and a simulated conflict to practice resolving.

SANDBOX="/tmp/git-workflow-$(date +%s)"
mkdir -p "$SANDBOX" && cd "$SANDBOX" || exit 1

git init
git config user.name "Dev Learner"
git config user.email "learner@example.com"

# initial commit on main
echo "# Project" > README.md
git add README.md && git commit -m "initial commit"

# --- fast-forward merge demo ---
git checkout -b feature/ff
echo "feature content" > feature.txt
git add feature.txt && git commit -m "add feature.txt"
git checkout main
git merge feature/ff
echo "Fast-forward merge done — history is linear because main hadn't diverged"

# --- three-way merge demo ---
git checkout -b feature/nonff
echo "non-ff content" > nonff.txt
git add nonff.txt && git commit -m "add nonff.txt"
git checkout main
echo "main update" >> README.md
git add README.md && git commit -m "update readme on main"
git merge feature/nonff --no-edit
echo "Three-way merge done — merge commit created because both branches diverged"

# --- conflict demo ---
git checkout -b feature/conflict
echo "version from branch" > shared.txt
git add shared.txt && git commit -m "branch version of shared.txt"
git checkout main
echo "version from main" > shared.txt
git add shared.txt && git commit -m "main version of shared.txt"
# merge should produce a conflict
git merge feature/conflict || true
if [ -f shared.txt ]; then
  # resolve by taking main's version
  echo "version from main" > shared.txt
  git add shared.txt
  git commit --no-edit
  echo "Conflict resolved manually — kept main's version"
fi

# --- revert the merge ---
git revert --no-edit HEAD
echo "Reverted the merge commit — safe undo for shared history"

git log --oneline --graph --all
echo "Sandbox at $SANDBOX"
