---
last_verified: 2026-07-27
tool_version: n/a
sources: []
---

# Linux & OS Fundamentals — quick primer

> First-day notes on the operating system layer underneath every DevOps tool. What it does, why it matters, and the ideas you'll use every day without thinking about them.

## What is it?

The operating system is the software that sits between you (or any program) and the physical computer. It manages the CPU, memory, disk, network interfaces, and every device plugged into the machine. On a laptop it's macOS or Windows; on almost every server you'll touch in a DevOps role, it's Linux. Linux is a family of Unix-like operating systems — Ubuntu, Debian, RHEL, Amazon Linux — all built on the same kernel, the core piece that talks directly to the hardware. When you SSH into a remote machine, the shell you land in is managed by that OS. When a Docker container runs, the host OS is controlling which resources that container can use. When a pipeline fails with a permission error, the OS is the thing enforcing the rule you just hit.

I used to think the OS was just a background layer I could ignore. That worked until I tried to debug why my container couldn't read a file, why my deploy script worked on my laptop but not in CI, and why `sudo` kept asking for a password I didn't have. Each of those problems traced back to something the OS was doing.

## Why does it matter for DevOps?

DevOps tools — Docker, Kubernetes, Ansible, Terraform — all sit on top of the OS. They don't replace it; they orchestrate it. Understanding what the OS does means you can read errors that reference filesystems, permissions, processes, or networking — which is most errors. When a CI pipeline can't find a binary, that's a PATH issue. When a service won't start, that's usually a permissions or port conflict. When a container leaks memory, the host OS cgroup configuration is involved. Without OS fundamentals, every error looks like a black box. With them, you can trace what actually happened.

## Key terminology

- **Kernel** — the core of the OS; directly manages hardware resources. Example: the Linux kernel is what schedules CPU time between your shell and a running Docker container.
- **Shell** — the command-line interface you type into. Bash is the most common. Example: typing `ls -la` in an SSH session runs through bash.
- **Filesystem** — how the OS organizes files on disk. Permissions are stored here. Example: `/etc` holds system config files, usually owned by root.
- **Users and groups** — identities the OS uses to decide who can do what. Example: the `www-data` user often owns application files so the web server process can read them.
- **Permissions** — read/write/execute bits on files and directories. Example: `chmod 755 script.sh` lets everyone run it but only the owner can edit it.
- **Process** — a running instance of a program. Example: a web server like Nginx is a long-running process you can inspect with `ps aux`.
- **Standard streams** — stdin, stdout, stderr: the input and output channels every process inherits. Example: `2>&1` redirects error output to the same place as normal output.
- **Environment variables** — named values the OS injects into every running process. Example: `$HOME` tells programs where your home directory is.
- **PATH** — an environment variable listing directories the OS searches for commands. Example: if `terraform` isn't on your PATH, typing `terraform plan` returns "command not found."

## A concrete example

Run these commands in any Linux environment (a local VM, WSL, or a cloud instance) to see the OS in action:

```bash
# See who you are and what groups you belong to
id
whoami

# List the filesystem roots and notice /etc, /home, /var
ls /

# Inspect a system process — Nginx or sshd often exist
ps aux | grep nginx | head -5

# Check your environment and notice $PATH
env | grep PATH

# See the permissions on a critical system file
ls -la /etc/passwd
```

Running these shows you the OS identity layer (`id`), how files are organized (`ls /`), what's actually running (`ps aux`), what variables your shell inherited (`env`), and how the OS controls access (`ls -la`). This is the foundation everything else builds on.

## How this connects to what's next

Once these ideas feel familiar, Docker becomes a facility that namespaces and isolates these OS resources on purpose. Kubernetes then orchestrates many containers across many nodes — still managing the same OS primitives, just at scale. Ansible uses SSH to connect to remote hosts and runs shell commands against their OS. Every tool in this kit touches this layer. Starting here means every tool after it has a reference point for what's happening underneath.
