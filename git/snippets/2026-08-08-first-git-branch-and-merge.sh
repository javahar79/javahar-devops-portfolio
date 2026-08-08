#!/usr/bin/env bash
# last_verified: 2026-08-08 · git

git init demo-repo
cd demo-repo
echo "hello" > file.txt
git add file.txt
git commit -m "initial commit"
git checkout -b feature
echo "world" >> file.txt
git add file.txt
git commit -m "add world to file"
git checkout main
git merge feature
