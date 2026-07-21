#!/bin/bash
# last_verified: 2026-07-20 · git n/a
#
# Demo: git reflog for recovery and interactive rebase for history cleanup
# reflog part runs non-interactively; rebase uses GIT_EDITOR to simulate

SANDBOX="/tmp/git-reflog-demo-$(date +%s)"
mkdir -p "$SANDBOX"
cd "$SANDBOX" || exit 1

git init
git config user.name "Dev Learner"
git config user.email "learner@example.com"

echo "# Practice" > README.md
git add README.md
git commit -m "initial commit"

# make a few messy commits
echo "line1" >> notes.txt
git add notes.txt
git commit -m "add notes line1"

echo "line2" >> notes.txt
git add notes.txt
git commit -m "add notes line2"

echo "typo" >> notes.txt
git add notes.txt
git commit -m "quick typo"

echo "--- reflog before mistake ---"
git reflog

# accidentally reset hard to HEAD~3 — lost the last 3 commits
git reset --hard HEAD~3

echo "--- reflog after reset ---"
git reflog

# recover by resetting to the previous HEAD from reflog
git reset --hard 'HEAD@{1}'

echo "--- recovered log ---"
git log --oneline

# clean up with interactive rebase
# script GIT_EDITOR to squash the 2nd and 3rd commits automatically
export GIT_EDITOR="sed -i '2s/^pick/squash/;3s/^pick/squash/'"
git rebase -i HEAD~3

echo "--- cleaned log ---"
git log --oneline

echo "Sandbox at $SANDBOX"
