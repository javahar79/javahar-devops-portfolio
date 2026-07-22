#!/bin/bash
# last_verified: 2026-07-22 · git 2.49.0

# git-branching-merging-conflicts.sh
# I wrote this to practice the branching/merging/conflict flow
# without messing up my real repos.

# Create an isolated temp directory so I can experiment freely
TMPDIR=$(mktemp -d)
cd "$TMPDIR" || exit

echo "=== Creating demo repo ==="
git init
git config user.email "learner@example.com"
git config user.name "Learner"

echo "main content" > file.txt
git add file.txt
git commit -m "Initial commit"

echo "=== Branching and making conflicting changes ==="
# Create a feature branch and change the same file on both branches
git checkout -b feature/hello
echo "hello branch" > file.txt
git add file.txt
git commit -m "feature: say hello"

git checkout main
echo "main branch change" > file.txt
git add file.txt
git commit -m "main: update greeting"

echo "=== Merging — expect a conflict ==="
# Both branches edited file.txt, so merge should fail
if git merge feature/hello; then
  echo "Merge succeeded (no conflict)"
else
  echo "Conflict detected — resolving it"
  # Resolve by choosing a merged value
  echo "resolved content" > file.txt
  git add file.txt
  git commit -m "chore: resolve merge conflict"
fi

echo "=== Final state ==="
git log --oneline --graph --all

# Clean up the temp directory after we're done
cd /
rm -rf "$TMPDIR"
