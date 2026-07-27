#!/bin/bash
# last_verified: 2026-07-27 · git n/a

# common-rebase-reset-patterns.sh
# I wrote this to practice rebase and reset without
# wrecking my real repos. Watching git log every step
# makes it obvious what the history looks like.

set -u
TMPDIR=$(mktemp -d)
cd "$TMPDIR" || exit 1

git init
git config user.email "learner@example.com"
git config user.name "Learner"

# Baseline: three sequential commits
echo "v1" > app.txt
git add app.txt
git commit -m "v1"

echo "v2" > app.txt
git add app.txt
git commit -m "v2"

echo "v3" > app.txt
git add app.txt
git commit -m "v3"

echo "=== Initial history ==="
git log --oneline

# Feature branch diverges from v1
git checkout -b feature v1
echo "feature-change" > app.txt
git add app.txt
git commit -m "feature: divergent change"

echo "=== History after feature branch ==="
git log --oneline --all --graph

# Rebase feature onto latest main (HEAD)
# This replays feature's single commit on top of v3
git rebase main

echo "=== History after rebase ==="
git log --oneline --graph --all

# Now demonstrate reset types on main
git checkout main

# soft reset: keep changes staged, move HEAD back to v2
git reset --soft v2
echo "=== After soft reset (git status) ==="
git status --short

# mixed reset: keep changes unstaged, move HEAD back to v1
git reset --mixed v1
echo "=== After mixed reset (git status) ==="
git status --short

# hard reset: throw away everything, back to v1
git reset --hard v1
echo "=== After hard reset (git log) ==="
git log --oneline

echo "=== Final diff stat ==="
git status

rm -rf "$TMPDIR"
