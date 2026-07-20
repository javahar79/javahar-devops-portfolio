#!/bin/bash
# last_verified: 2026-07-20 · git n/a
# L2 — minimal git config for user.name, user.email, and init

# I set user.name and user.email globally so every new repo gets them automatically.
# I got tripped up once when I set these per-repo in a test project, then forgot
# to set them globally — my next real project had commits under the wrong author.
git config --global user.name "Dev Learner"
git config --global user.email "learner@example.com"

# Verify they stuck. I don't trust myself to remember whether I set these.
git config --global user.name
git config --global user.email

# Set the default branch name for new repos so I'm not always renaming master
# to main after init.
git config --global init.defaultBranch main

echo "Git config set. Run 'git config --list' to review."
