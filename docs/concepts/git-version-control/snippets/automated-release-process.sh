#!/bin/bash
# last_verified: 2026-08-14 · git n/a

# automated-release-process.sh
# Pattern: Git & Version Control + Scripting & Automation.
# Drives a tag-based release: bumps the version file, commits it,
# creates an annotated tag, and pushes both. The same steps I used
# to do by hand, now wrapped in a repeatable script.

set -euo pipefail

VERSION="${1:?usage: automated-release-process.sh <version>, e.g. ./automated-release-process.sh 1.4.0}"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "not inside a git repository" >&2
  exit 1
fi

# Refuse to release from a dirty tree or a detached HEAD —
# a release commit has to be reproducible and attributable.
if [ -n "$(git status --porcelain)" ]; then
  echo "working tree is not clean; commit or stash first" >&2
  exit 1
fi
if [ -z "$(git symbolic-ref -q HEAD)" ]; then
  echo "detached HEAD; check out a branch before releasing" >&2
  exit 1
fi

VERSION_FILE="${VERSION_FILE:-VERSION}"

# Version file bump: write, stage, commit. This is the "bump" step.
echo "$VERSION" > "$VERSION_FILE"
git add "$VERSION_FILE"
git commit -m "release: bump to $VERSION"

# Annotated tag with a message, so the tag carries more than a pointer.
git tag -a "v$VERSION" -m "release v$VERSION"

# Push the commit, then the tag. Pushing the tag is what actually
# publishes a release in most workflows (triggers the deploy pipeline).
git push origin HEAD
git push origin "v$VERSION"

echo "released v$VERSION on $(git rev-parse --short HEAD)"
