#!/usr/bin/env bash
# last_verified: 2026-08-10 - bash n/a

# System administration patterns for DevOps
# Small snippets I use when checking a Linux host.

# 1. Check disk usage on the root filesystem
# df is the quickest way to see if a disk is filling up
df -h /

# 2. List the top processes by memory usage
# I use this when a host feels slow to find the culprit
ps aux --sort=-%mem | head -n 6

# 3. Check if a service is running
# systemctl is standard on most modern Linux distros
systemctl is-active --quiet sshd && echo "SSH is running" || echo "SSH is down"

# 4. Find files larger than 100MB
# Handy when /tmp or /var/log grows unexpectedly
find /var/log -type f -size +100M -exec ls -lh {} \;
