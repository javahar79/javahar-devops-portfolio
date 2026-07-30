#!/bin/bash
# last_verified: 2026-07-30 · git n/a
#
# Automate git bisect to find the first breaking commit.
#
# Usage:
#   ./git-bisect-automation.sh "<test-command>" [bad-ref] [good-ref]
#
# The test command exits 0 for "good" (no bug) and non-zero for "bad" (bug present).
# Prefix with "!" to invert the exit logic (e.g., when the test fails on good code).
#
# Examples:
#   ./git-bisect-automation.sh "npm test" HEAD v1.0.0
#   ./git-bisect-automation.sh "!pytest -x tests/" HEAD main

set -euo pipefail

TEST_CMD="${1:-}"
BAD_REF="${2:-HEAD}"
GOOD_REF="${3:-}"

if [[ -z "$TEST_CMD" ]]; then
    echo "Usage: $0 \"<test-command>\" [bad-ref] [good-ref]"
    exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: not inside a git repository."
    exit 1
fi

# Create a temporary test script that `git bisect run` can execute.
TMP_SCRIPT="$(mktemp /tmp/git-bisect-test.XXXXXX.sh)"

cleanup() {
    rm -f "$TMP_SCRIPT"
    git bisect reset >/dev/null 2>&1 || true
}
trap cleanup EXIT

# Handle "!" prefix to invert exit codes.
if [[ "$TEST_CMD" == !* ]]; then
    INVERT=1
    TEST_CMD="${TEST_CMD#!}"
else
    INVERT=0
fi

# Generate the per-commit test runner. The heredoc expands $TEST_CMD and
# $INVERT from this script's scope; \$rc and \$? are escaped so they are
# evaluated at runtime inside the temp script.
cat > "$TMP_SCRIPT" <<SCRIPT
#!/bin/bash
$TEST_CMD
rc=\$?
if [[ "$INVERT" -eq 1 ]]; then
    [[ \$rc -ne 0 ]] && exit 0 || exit 1
fi
exit \$rc
SCRIPT
chmod +x "$TMP_SCRIPT"

# Start the bisect session.
git bisect start
git bisect bad "$BAD_REF"

if [[ -n "$GOOD_REF" ]]; then
    git bisect good "$GOOD_REF"
else
    echo "No good-ref provided. Mark a good commit manually:"
    echo "  git bisect good <commit>"
    echo "Then re-run this script without arguments to continue."
    exit 0
fi

echo "Running bisect with: $TEST_CMD"
if git bisect run "$TMP_SCRIPT"; then
    echo ""
    echo "=== First bad commit ==="
    git log -1 --oneline
else
    echo "Bisect did not complete — check the output above for details."
fi
