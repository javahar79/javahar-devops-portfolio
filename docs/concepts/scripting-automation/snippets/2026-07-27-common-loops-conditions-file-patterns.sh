#!/bin/bash
# last_verified: 2026-07-27 · bash n/a

# common-loops-conditions-file-patterns.sh
# I wrote this snippet to practice the three patterns
# I reach for most often: loops over arrays, conditionals
# on strings/exit codes, and idempotent file processing.

# --- Loop over an array ---
SERVICES=("nginx" "postgres" "redis")
for svc in "${SERVICES[@]}"; do
  echo "Checking ${svc}"
done

# --- Conditional: string match + exit code check ---
USER="admin"
FILE="/tmp/deploy.lock"
if [[ "$USER" != "admin" ]]; then
  echo "Skip: not admin"
elif [ ! -f "$FILE" ]; then
  echo "No lock file — safe to deploy"
else
  echo "Blocked by lock file"
fi

# --- Conditional on command exit code ---
if grep -q "ready" /tmp/health.txt 2>/dev/null; then
  echo "Healthy"
else
  echo "Unhealthy"
fi

# --- File processing: read, filter, write ---
SRC="/tmp/input.log"
OUT="/tmp/output.log"
if [ -f "$SRC" ]; then
  grep -E "ERROR|WARN" "$SRC" > "$OUT" 2>/dev/null || true
  COUNT=0
  while IFS= read -r line; do
    echo "$line" > /dev/null
    COUNT=$((COUNT + 1))
  done < "$OUT"
  echo "Extracted ${COUNT} lines"
else
  echo "Source file missing — nothing to process"
fi
