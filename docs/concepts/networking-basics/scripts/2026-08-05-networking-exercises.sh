#!/bin/bash
# last_verified: 2026-08-05 · Networking Basics L2

# Networking exercises: DNS resolution, port testing, and SSH tunneling

# DNS resolution — I use `host` because it's the simplest way to see
# what IP a hostname resolves to. This is the first thing I check
# whenever a service isn't reachable.
echo "=== DNS Resolution ==="
host google.com

echo ""
echo "=== Port Testing ==="
# I'm testing localhost port 22 (SSH) using bash's /dev/tcp built-in.
# This avoids needing extra tools like `nc` or `nmap` — it works on
# any system with bash. The timeout prevents the script from hanging
# if the port is closed and the connection attempt stalls.
timeout 3 bash -c '</dev/tcp/localhost/22' 2>/dev/null && echo "SSH port 22 is open" || echo "SSH port 22 is closed"

echo ""
echo "=== SSH Tunneling ==="
# SSH local port forwarding (-L) tunnels a local port through an SSH
# connection to a remote host. I'm showing the command pattern here
# since actually running it requires a live SSH server. The syntax
# is: ssh -L <local-port>:<remote-host>:<remote-port> <user>@<host>
echo "To create a local tunnel, run:"
echo "  ssh -L 8080:localhost:80 user@remote-host"
echo "This forwards local port 8080 to port 80 on the remote host."