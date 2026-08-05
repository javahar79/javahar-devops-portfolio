---
last_verified: 2026-08-05
tool_version: n/a
---

# Ansible — quick primer

> First-day notes for someone who's never used Ansible. Personal voice, plain language.

## What is it?

Ansible is an automation tool that lets you manage servers and infrastructure as code. I think of it like a to-do list that a robot reads and executes — you write what you want the system to look like in a file, and Ansible makes it happen. It's similar to how I use `git` to track code changes, except Ansible tracks and enforces the state of servers, packages, and configurations.

## What does it do?

It connects to remote machines over SSH and runs commands or applies configuration steps called "tasks." I can use it to install software, create users, start services, copy files, and more — all from a single declarative file. It figures out what needs to change and only makes those changes.

## Why does it exist?

Before tools like Ansible, managing even a handful of servers meant logging into each one by hand and running commands. If something broke or a new machine joined the fleet, you had to repeat the same steps manually. Ansible solves this by letting me describe the desired state once and apply it anywhere, consistently. DevOps engineers and sysadmins use it daily to keep infrastructure predictable.

## Key terminology

- **Playbook** — a YAML file that defines a set of tasks to run on target machines. Example: `ansible-playbook site.yml` runs all the steps in that file.
- **Play** — a single section of a playbook that targets one group of hosts and applies a set of tasks to them.
- **Task** — the smallest unit of work in a playbook. Each task calls an Ansible module to do one thing, like install a package or start a service.
- **Module** — a reusable unit of code that Ansible calls to perform an action. Example: the `apt` module installs packages on Debian systems.
- **Inventory** — a list of the machines Ansible manages, grouped however I want. Example: I can group servers by role like `webservers` or `databases`.
- **Handler** — a special task that only runs when another task notifies it, usually to restart a service after a configuration change.
- **Idempotency** — the property that running the same playbook twice produces the same result as running it once. Example: if a package is already installed, Ansible skips it instead of reinstalling.

## A tiny example

```yaml
---
- name: Ping my servers
  hosts: all
  tasks:
    - name: Test connectivity
      ansible.builtin.ping:
```

This playbook tells Ansible to connect to every machine in my inventory and run a simple ping module to verify SSH connectivity works.

## What I'll cover next

Next I want to write a playbook that actually installs a package and starts a service, then try using variables and templates to make my configurations reusable across different environments.
