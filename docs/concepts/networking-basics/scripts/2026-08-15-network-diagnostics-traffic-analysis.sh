#!/usr/bin/env bash
# last_verified: 2026-08-15 · devops n/a

# Network diagnostics and traffic analysis — my practice script for the week.
# The goal: when something is slow or down, work through connectivity first,
# then look at what's actually on the wire. I wrote this to drill the order
# I keep forgetting: reachable? -> resolving? -> what's listening? -> what's
# actively talking?

TARGET="${1:-example.com}"

echo "=== 1. Am I connected to anything at all? ==="
# ip -brief address lists interfaces and their addresses in one compact line
# each. Empty lo-only output usually means the box is isolated.
ip -brief address || echo "no interfaces found"

echo ""
echo "=== 2. What's my default route? ==="
ip route show default || echo "no default route set"

echo ""
echo "=== 3. Does the target resolve? ==="
# dig +short gives just the answer lines; empty means resolution failed.
dig +short "$TARGET" || echo "dig not available"

echo ""
echo "=== 4. Can I reach it? ==="
# -c 4 sends four pings, -W 2 waits 2s each so a dead host fails fast.
ping -c 4 -W 2 "$TARGET" 2>&1 | tail -2 || echo "ping failed for $TARGET"

echo ""
echo "=== 5. Which ports are listening on this host? ==="
# ss -tln shows TCP listeners; the LISTEN column tells me what I can
# actually connect to locally before I go blaming the network.
ss -tln | head -10 || echo "ss not available"

echo ""
echo "=== 6. Traffic summary — how many active connections? ==="
# ss -s prints a per-state count. A cluster of ESTAB entries is the
# "traffic analysis" part — it shows real conversations happening now.
ss -s | head -6 || echo "no socket stats available"

echo ""
echo "=== 7. Who am I actually talking to right now? ==="
# Established TCP connections, numeric so no DNS noise. The remote IP:port
# pair is what I'd grep in a firewall log.
ss -tn state established | head -10 || echo "no established connections"

echo ""
echo "done — diagnostics first, then traffic."
