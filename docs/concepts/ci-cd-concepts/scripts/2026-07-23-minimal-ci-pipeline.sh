#!/usr/bin/env bash
# last_verified: 2026-07-23 · n/a (concept)

# I wrote this to practice what a CI pipeline does under the hood
# It runs lint -> build -> test stages like a real CI system

# --- Setup ---
PROJECT_DIR=$(mktemp -d)
trap 'rm -rf "$PROJECT_DIR"' EXIT
cd "$PROJECT_DIR" || exit 1

echo "=== Setting up sample project ==="
cat > app.py <<'PY'
import json
def main():
    with open("config.json") as f:
        cfg = json.load(f)
    print(f"App {cfg['name']} v{cfg['version']} started")
if __name__ == "__main__":
    main()
PY

echo '{"name": "ci-demo", "version": "1.0.0"}' > config.json

# Stage 1: Lint
echo ""
echo "=== Stage 1: Lint ==="
python3 -m py_compile app.py && echo "  ok Python syntax valid"
python3 -m json.tool config.json > /dev/null && echo "  ok JSON is valid"

# Stage 2: Build (interpreted — just verify files exist)
echo ""
echo "=== Stage 2: Build ==="
test -f app.py && test -f config.json && echo "  ok all source files present"

# Stage 3: Test
echo ""
echo "=== Stage 3: Test ==="
output=$(python3 app.py)
expected="App ci-demo v1.0.0 started"
if [ "$output" = "$expected" ]; then
    echo "  ok test passed — output matches expected"
else
    echo "  FAIL test failed — got '$output', expected '$expected'"
    exit 1
fi

echo ""
echo "=== Pipeline: PASS ==="
