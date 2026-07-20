#!/bin/bash
# last_verified: 2026-07-20 · git n/a
#
# Clean git history, audit .gitignore, and recover from a merge conflict
# Sets up a sandbox repo so I can practice without touching a real project

SANDBOX="/tmp/git-clean-history-$(date +%s)"
mkdir -p "$SANDBOX"
cd "$SANDBOX" || exit 1

git init
git config user.name "Dev Learner"
git config user.email "learner@example.com"

echo "# Practice repo" > README.md
git add README.md
git commit -m "first commit"

# create a feature branch with some work
git switch -c feature/add-logging
echo "log() { echo \$1; }" > logger.sh
git add logger.sh
git commit -m "add logging helper"

# forget to add .gitignore and accidentally commit a secrets file
echo "DB_PASSWORD=supersecret" > .env
git add .env
git commit -m "add config"

# audit: .gitignore is missing, .env is tracked
echo "--- .gitignore audit ---"
if [ -f .gitignore ]; then
  echo ".gitignore exists"
else
  echo ".gitignore missing — creating one"
  cat > .gitignore <<'IGNORE'
.env
*.log
IGNORE
  git add .gitignore
  git commit -m "add .gitignore"
fi

# stop tracking .env but keep it locally
git rm --cached .env
git commit -m "stop tracking .env"

# simulate a merge conflict
git switch main
echo "README updated on main" >> README.md
git commit -m "update readme on main"

# both branches touched README.md — this merge will conflict
if ! git merge feature/add-logging -m "merge feature/add-logging"; then
  echo "Merge conflict detected — resolving..."
  # keep the main version of README.md for this demo
  git checkout --ours README.md
  git add README.md
  git commit -m "resolve merge conflict: keep main README"
fi

echo "Sandbox at $SANDBOX"
echo "Inspect with: git -C $SANDBOX log --oneline --graph --all"
