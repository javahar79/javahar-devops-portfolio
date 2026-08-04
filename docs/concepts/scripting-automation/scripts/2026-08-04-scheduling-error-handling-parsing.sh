#!/usr/bin/env bash
# last_verified: 2026-08-04 · devops n/a

# con-013: Scripting & Automation — scheduling, error handling, and stdout parsing
# I wrote this script to practice the three core automation skills I keep
# hitting in real DevOps work: scheduling recurring tasks, handling errors
# gracefully, and parsing command output.

echo "=== Scheduling Demo ==="
# I use `at` to schedule a one-off job instead of editing crontab directly,
# because at is simpler for single delayed executions and doesn't require
# knowing the cron syntax.
echo "echo 'scheduled job ran at $(date)' | at now + 1 minute 2>/dev/null && echo 'Job scheduled with at' || echo 'at not available — skipping scheduling demo'"

echo ""
echo "=== Error Handling Demo ==="
# I use trap to catch failures instead of set -e because trap gives me
# more control — I can log the error and decide whether to exit or continue.
handle_error() {
  local exit_code=$?
  echo "Command failed with exit code $exit_code on line $1"
}
trap 'handle_error $LINENO' ERR

# This command should succeed
ls /tmp >/dev/null 2>&1 && echo "ls /tmp succeeded" || echo "ls /tmp failed"

# This command should fail — trap catches it
ls /nonexistent_directory_xyz 2>/dev/null || echo "Caught expected failure for nonexistent directory"

echo ""
echo "=== Stdout Parsing Demo ==="
# I pipe command output through grep, awk, and sed to extract exactly
# what I need — this is the pattern I use constantly when parsing logs
# or command output in automation scripts.

# grep: filter lines matching a pattern
echo "--- grep: filter lines containing 'root' from /etc/passwd ---"
grep 'root' /etc/passwd 2>/dev/null | head -3 || echo "grep demo skipped (no /etc/passwd)"

# awk: extract specific fields
echo "--- awk: extract first field from each line ---"
echo -e "web-server\trunning\ncache-server\tstopped\ndb-server\trunning" | awk -F'\t' '{print $1 " is " $2}'

# sed: replace text in place
echo "--- sed: replace stopped with degraded ---"
echo "cache-server is stopped" | sed 's/stopped/degraded/'

echo ""
echo "=== All demos complete ==="