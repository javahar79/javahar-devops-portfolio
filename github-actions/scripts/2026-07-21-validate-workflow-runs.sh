# last_verified: 2026-07-21 · GitHub Actions (gh CLI n/a)

# I wrote this to practice validating workflow runs from the terminal
# instead of clicking through the GitHub UI every time I pushed a change.
# Usage: bash 2026-07-21-validate-workflow-runs.sh [--failed]

cd "$(dirname "$0")" || exit 1

echo "=== Recent workflow runs ==="
gh run list --limit 5 --json conclusion,displayTitle,status,databaseId,createdAt \
  --jq '.[] | "\(.databaseId) \(.status) / \(.conclusion) \u2014 \(.displayTitle)"'

if [ "${1:-}" = "--failed" ]; then
  echo ""
  echo "=== Most recent failed run ==="
  FAILED_ID=$(gh run list --limit 5 --json conclusion,databaseId \
    --jq '.[] | select(.conclusion == "failure") | .databaseId' | head -1)
  if [ -n "$FAILED_ID" ]; then
    echo "Inspecting run $FAILED_ID ..."
    gh run view "$FAILED_ID" --log 2>/dev/null | grep -i "error\|failure" | head -30
  else
    echo "No failures in the last 5 runs."
    gh run list --limit 3 --json conclusion,displayTitle \
      --jq '.[] | "\(.conclusion) \u2014 \(.displayTitle)"'
  fi
fi

echo ""
echo "Done. Use --failed to jump straight to broken runs."
