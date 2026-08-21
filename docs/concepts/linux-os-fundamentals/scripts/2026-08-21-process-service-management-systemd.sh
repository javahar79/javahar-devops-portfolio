#!/usr/bin/env bash
# last_verified: 2026-08-21 - bash n/a

# Linux process and service management exercises
# This script practices systemd basics I have been learning:
# checking service status, starting/stopping services, and creating a custom unit file.

echo "=== Process and Service Management with systemd ==="

# 1. Check the status of a running service
# I started with sshd since it should be running on most systems
echo "--- Checking sshd status ---"
if systemctl is-active --quiet sshd 2>/dev/null || systemctl is-active --quiet ssh 2>/dev/null; then
    echo "sshd is running"
    systemctl status sshd 2>/dev/null || systemctl status ssh 2>/dev/null
else
    echo "sshd is not running (or not installed)"
fi

# 2. List all failed units
# This is useful for quickly spotting what is broken
echo ""
echo "--- Listing failed units ---"
systemctl list-units --state=failed --no-pager 2>/dev/null || echo "No failed units (or systemctl not available)"

# 3. Check process tree for a specific service
# I wanted to see what processes a service actually spawns
echo ""
echo "--- Process tree for sshd ---"
if pgrep -x sshd > /dev/null 2>&1; then
    pstree -p "$(pgrep -x sshd | head -1)" 2>/dev/null || ps aux | grep sshd | grep -v grep
else
    echo "sshd process not found"
fi

# 4. Create a simple systemd unit file
# I tried creating a dummy service to understand the unit file format
UNIT_DIR="/tmp/test-systemd"
mkdir -p "$UNIT_DIR"

cat > "$UNIT_DIR/hello-world.service" << 'EOF'
[Unit]
Description=Hello World Test Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/echo "Hello from systemd!"
ExecStartPost=/usr/bin/sleep 2
ExecStop=/usr/bin/echo "Stopping hello world"
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

echo ""
echo "--- Created unit file at $UNIT_DIR/hello-world.service ---"
cat "$UNIT_DIR/hello-world.service"

# 5. Check if we can list timers (systemd's cron alternative)
echo ""
echo "--- Listing active timers ---"
systemctl list-timers --all --no-pager 2>/dev/null | head -10 || echo "systemctl not available in this environment"

# 6. Practice: find the main PID of a service
echo ""
echo "--- Finding main PID of sshd ---"
if systemctl is-active --quiet sshd 2>/dev/null || systemctl is-active --quiet ssh 2>/dev/null; then
    MAINPID=$(systemctl show -p MainPID sshd 2>/dev/null || systemctl show -p MainPID ssh 2>/dev/null)
    echo "sshd $MAINPID"
else
    echo "sshd not running"
fi

# Got stuck on:
# - systemctl not being available in all environments (containers, minimal VMs)
# - The difference between Type=simple and Type=forking took a while to understand

# What I would try next:
# - Actually loading and starting the custom unit file with systemctl --user
# - Setting up a timer to run a script periodically (like cron but systemd-managed)
# - Exploring journalctl for reading service logs
