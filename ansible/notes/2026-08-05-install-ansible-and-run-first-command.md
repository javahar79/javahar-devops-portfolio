---
last_verified: 2026-08-05
tool_version: n/a
---

# Install Ansible and run my first command

I installed Ansible on my workstation today. On Ubuntu, the simplest way is `sudo apt update && sudo apt install -y ansible`. After install, I ran `ansible --version` to confirm it was working and it printed the version number along with the config paths.

Then I tried my first ad-hoc command: `ansible all -m ping` — this uses the `ping` module to check if Ansible can reach the hosts in my inventory. It failed at first because I didn't have an inventory file set up yet. I created a simple `/etc/ansible/hosts` file with `localhost ansible_connection=local` and ran the command again, and it returned `pong`.

The key thing I noticed: Ansible uses SSH by default to connect to remote machines, but for local testing I can set `ansible_connection=local` so it just runs commands on the same machine without SSH.
