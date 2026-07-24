#!/usr/bin/env bash
# last_verified: 2026-07-24 (n/a)

# Audit failed workflow runs via gh CLI and compare with the UI workflow.
# Accepts an optional workflow name filter and a time window (default 24h).

set -euo pipefail

usage() {
  cat <<EOF
Usage: $(basename "$0") [--workflow <name>] [--since <YYYY-MM-DD>] [--owner-repo <owner/repo>]

Examples:
  $(basename "$0")
  $(basename "$0") --workflow ci.yml --since 2026-07-01
  $(basename "$0") --owner-repo my-org/my-project
EOF
  exit 1
}

WORKFLOW=""
SINCE=""
OWNER_REPO=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --workflow) WORKFLOW="$2"; shift 2 ;;
    --since) SINCE="$2"; shift 2 ;;
    --owner-repo) OWNER_REPO="$2"; shift 2 ;;
    *) usage ;;
  esac
done

SINCE="${SINCE:-$(date -d '24 hours ago' +%Y-%m-%d)}"

GH_ARGS=()
[[ -n "$WORKFLOW" ]] && GH_ARGS+=(--workflow "$WORKFLOW")
[[ -n "$OWNER_REPO" ]] && GH_ARGS+=(--repo "$OWNER_REPO")

echo "=== Failed workflow runs since $SINCE ==="

gh run list "${GH_ARGS[@]}" \
  --limit 50 \
  --json conclusion,displayTitle,workflowName,url,createdAt \
  --jq '
    [.[] | select(.conclusion == "failure")] |
    sort_by(.createdAt) |
    reverse |
    .[] | "\(.createdAt[0:19]) | \(.workflowName) | \(.displayTitle) | \(.url)"
'

echo ""
echo "=== Summary ==="

RUNS_JSON=$(gh run list "${GH_ARGS[@]}" --limit 50 --json conclusion,workflowName)

TOTAL=$(echo "$RUNS_JSON" | jq 'length')
FAILED=$(echo "$RUNS_JSON" | jq '[.[] | select(.conclusion == "failure")] | length')
SUCCESS=$(( TOTAL - FAILED ))

echo "Total runs (last 50): $TOTAL"
echo "Successful:           $SUCCESS"
echo "Failed:               $FAILED"

if [[ "$FAILED" -gt 0 ]]; then
  echo ""
  echo "=== Opening each failed run in browser ==="
  echo "To inspect manually, run for each URL:"
  echo "$(basename "$0") | grep 'https://' | xargs -n1 gh browse"
fi
