#!/bin/bash
# last_verified: 2026-08-16 · git n/a
#
# sync-fork-and-clean-merged.sh — reusable helper for a forked/clone workflow.
#
# Two chores that come up constantly when you work from a fork:
#   1. --clean  delete local branches whose work is already merged into the base branch
#   2. --sync   add upstream if missing, fetch it, fast-forward the base branch,
#               and push the result back to origin so the fork matches upstream
#
# Usage:
#   ./sync-fork-and-clean-merged.sh --clean            # prune merged local branches
#   ./sync-fork-and-clean-merged.sh --sync [upstream_url]  # bring fork up to date
#   ./sync-fork-and-clean-merged.sh                    # --clean then --sync
#   ./sync-fork-and-clean-merged.sh --help

set -euo pipefail

base_branch() {
  local base
  base="$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null || true)"
  if [ -z "$base" ]; then
    base="origin/main"
  fi
  printf '%s' "${base#origin/}"
}

clean_merged() {
  local base ref
  base="$(base_branch)"
  ref="refs/heads/${base}"
  echo "== Removing local branches already merged into '${base}' =="
  local branch
  while IFS= read -r branch; do
    [ -z "$branch" ] && continue
    [ "$branch" = "$base" ] && continue
    if ! git merge-base --is-ancestor "$branch" "$ref" >/dev/null 2>&1; then
      echo "   keep     ${branch} (not merged into ${base})"
      continue
    fi
    git branch -d "$branch"
  done < <(git for-each-ref --format='%(refname:short)' refs/heads)
}

sync_fork() {
  local url="$1" base remote_ref
  base="$(base_branch)"
  remote_ref="refs/remotes/upstream/${base}"

  if ! git remote get-url upstream >/dev/null 2>&1; then
    if [ -n "$url" ]; then
      git remote add upstream "$url"
      echo "added upstream -> ${url}"
    else
      echo "No 'upstream' remote configured and no URL given — skipping sync."
      return 0
    fi
  fi

  echo "== Syncing fork from upstream/${base} =="
  git fetch upstream
  if ! git rev-parse --verify --quiet "$remote_ref" >/dev/null; then
    echo "upstream has no branch '${base}' — aborting sync"
    return 1
  fi
  git switch "$base"
  if ! git merge --ff-only "$remote_ref" >/dev/null 2>&1; then
    echo "'${base}' diverged from upstream/${base} — resolve before syncing"
    echo "hint: git rebase upstream/${base}  (then re-run --sync)"
    return 1
  fi
  git push origin "$base"
  echo "done: ${base} now matches upstream/${base}"
}

usage() {
  sed -n '2,14p' "$0"
}

case "${1:-}" in
  --clean) clean_merged ;;
  --sync)  sync_fork "${2:-}" ;;
  --help|-h) usage ;;
  "")
    clean_merged
    sync_fork ""
    ;;
  *)
    echo "unknown option: ${1}" >&2
    usage >&2
    exit 1
    ;;
esac