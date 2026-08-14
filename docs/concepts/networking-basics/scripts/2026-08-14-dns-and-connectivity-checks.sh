#!/bin/bash
# last_verified: 2026-08-14 · Networking Basics L2

# DNS and connectivity checks — my practice exercises for the week.
# The goal: given a hostname, confirm it resolves, then confirm a
# service is actually reachable on its port. This is the drill I
# run whenever something "is down" — half the time it's DNS, half
# the time it's a firewall, and the checks sort the two apart.

HOST="example.com"
PORT=443

echo "=== 1. Resolve the hostname (getent uses the system resolver) ==="
# getent consults /etc/hosts and DNS in the order configured in
# /etc/nsswitch.conf — same path most CLI tools take.
getent hosts "$HOST" || echo "no DNS entry for $HOST"

echo ""
echo "=== 2. Ask a specific resolver with dig (shows extra record types) ==="
# dig +short skips the verbose output and just prints answers.
dig +short "$HOST"

echo ""
echo "=== 3. Reverse lookup — what name is behind the IP? ==="
# Get the IP from step 1/2 and query it backwards. Useful for
# spotting a proxy or CDN in front of the real server.
IP=$(getent hosts "$HOST" | awk '{print $1}' | head -1)
[ -n "$IP" ] && dig +short -x "$IP" || echo "no IP captured"

echo ""
echo "=== 4. TCP connectivity — is anything listening on the port? ==="
# bash's /dev/tcp avoids needing nc. 3s timeout so a filtered port
# fails fast instead of hanging the whole script.
timeout 3 bash -c "</dev/tcp/$HOST/$PORT" 2>/dev/null \
  && echo "$HOST:$PORT is reachable" \
  || echo "$HOST:$PORT is NOT reachable"

echo ""
echo "=== 5. Layer-7 check — does it actually serve HTTPS? ==="
# curl -sI sends a HEAD request and shows the HTTP status line.
# A 200/301 means the service works end to end, not just TCP.
curl -sI --max-time 5 "https://$HOST/" | head -1 || echo "no HTTP response"

echo ""
echo "=== 6. Local listeners — is my own service bound correctly? ==="
# ss -ltn shows listening TCP sockets; 'ss' is the modern netstat.
ss -ltn | head -10

echo ""
echo "done — checks above should resolve, then connect."
