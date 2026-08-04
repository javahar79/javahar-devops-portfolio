#!/usr/bin/env bash
# last_verified: 2026-08-04 · devops n/a

# con-015: Infrastructure as Code — declarative configs and CLI exercises
# I wrote this script to practice managing infrastructure resources through
# declarative config files and CLI commands — the core IaC workflow I use
# every day with Terraform and OpenTofu.

echo "=== Declarative Config Demo ==="
# I write a simple declarative config as a plain text file that describes
# the desired state, then use a CLI tool to reconcile the actual state
# to match it. This is the fundamental IaC pattern.

CONFIG_FILE=$(mktemp /tmp/iac-demo-XXXXXX.yaml)
cat > "$CONFIG_FILE" <<'EOF'
resources:
  - name: demo-bucket
    type: storage
    state: present
    properties:
      region: us-east-1
  - name: demo-vpc
    type: network
    state: present
    properties:
      cidr: 10.0.0.0/16
EOF

echo "Wrote declarative config to $CONFIG_FILE"
cat "$CONFIG_FILE"

echo ""
echo "=== CLI Reconcile Demo ==="
# In real IaC workflows I run a CLI command that reads the config and
# makes the actual infrastructure match the declared state.
# Since I may not have terraform/ tofu installed in this environment,
# I simulate the plan/apply pattern with a dry-run echo.

echo "--- Plan phase: show what would change ---"
echo "Plan: 2 resources to create"
echo "  + demo-bucket (storage, us-east-1)"
echo "  + demo-vpc (network, 10.0.0.0/16)"

echo ""
echo "--- Apply phase: create resources ---"
# I parse the YAML config with simple grep/awk to extract resource names
# — this is a common pattern when I need to inspect IaC configs from
# shell scripts before running the full CLI tool.
grep -E '^\s+- name:' "$CONFIG_FILE" | awk '{print $3}' | while read -r res_name; do
  echo "Creating resource: $res_name"
done

rm -f "$CONFIG_FILE"
echo "Cleaned up temp config file"

echo ""
echo "=== IaC CLI exercises complete ==="