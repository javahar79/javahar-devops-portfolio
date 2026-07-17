---
last_verified: 2026-07-17
tool_version: n/a
---

# Linux & OS Fundamentals — quick primer

> First-day notes on Linux & OS Fundamentals. What it is, why it matters, and the key ideas to know.

## What is it?

I think of an operating system as the middleman between the hardware and the software. It manages the CPU, memory, disks, and network so programs don't have to fight over resources. Linux is the OS that runs almost every server, container, and cloud instance I'll touch in DevOps. Before I can configure anything, I need to understand how Linux organizes files, who can access what, and what happens when a program starts or stops.

## Why does it matter for DevOps?

I'm going to spend most of my day in a terminal connected to a Linux box. Containers, VMs, and cloud instances all run an OS underneath. When a deployment fails or a service won't start, the root cause is usually something OS-level: a missing file permission, a port already in use, a disk full, or a process that crashed on startup. Without fundamentals, I'm just running commands I half understand and troubleshooting by trial and error.

## Key terminology

- **Filesystem hierarchy** — The directory layout (/, /home, /etc, /var). Example: /etc holds configs, /var/log stores logs I inspect when debugging.
- **Permissions (chmod/chown)** — Controls who can read, write, or execute a file. Example: `chmod 755 script.sh` lets everyone run it but only the owner can edit it.
- **Process** — A running instance of a program. Example: `ps aux` shows every process and its owner.
- **Service** — A long-running background process managed by systemd. Example: `systemctl status nginx` tells me if the web server is running.
- **Package manager** — Tool to install and update software. Example: `apt install htop` on Debian-based systems.
- **Environment variables** — Key-value pairs that configure program behavior. Example: `PATH` tells the shell where to find executables.
- **Shell** — The command-line interpreter that reads and runs my commands. Example: `bash` or `zsh`.
- **Root vs. regular user** — Root has unrestricted access; regular users have limits. Example: `sudo` temporarily elevates privileges.

## A concrete example

```bash
#!/bin/bash
# Check if a service is running, restart it if not, and log the result
SERVICE="nginx"
if systemctl is-active --quiet "$SERVICE"; then
  echo "$SERVICE is running"
else
  echo "$SERVICE is down — restarting"
  sudo systemctl restart "$SERVICE"
  systemctl status "$SERVICE"
fi
```

This script checks the status of nginx, restarts it if it's down, and prints the new status. It uses systemctl for service management, sudo for privilege escalation, and basic scripting — all core OS skills I keep reaching for.

## How this connects to what's next

Once I'm comfortable navigating Linux, the next step is Git for version control, then container tools like Docker that package apps with their OS dependencies. Every tool after this assumes I know my way around a terminal.
