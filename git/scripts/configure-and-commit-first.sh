#!/bin/bash
# Minimal Git setup + first commit — L1 scratch script

git config --global user.name "javahar"
git config --global user.email "javahar@example.com"

mkdir -p ~/git-demo
cd ~/git-demo || exit
git init
echo "# Demo Project" > README.md
git add README.md
git commit -m "Initial commit"
echo "Done. First commit made."
