---
last_verified: 2026-07-22
tool_version: n/a
---

# Scripting & Automation — quick primer

> First-day notes on Scripting & Automation. What it is, why it matters, and the key ideas to know.

## What is it?

Scripting is the practice of writing small programs that automate repetitive tasks. Instead of clicking through the same five menu steps every morning, I write a script that does it for me in seconds. Automation takes that further — it's the practice of wiring those scripts together so they run on a schedule, in response to an event, or as part of a larger pipeline. In DevOps, scripting is my day-to-day tool; automation is the goal I'm working toward.

I think of it like cooking: scripting is following a recipe by hand, and automation is building a machine that makes the same dish every time without supervision. The machine doesn't replace the chef — it frees the chef to focus on harder problems.

## Why does it matter for DevOps?

Almost every DevOps task involves repetition: copying files, restarting services, checking logs, running the same lint-and-test cycle. Scripting turns those into one-liners or small scripts I can run instead of doing them manually. Automation bundles scripts into workflows that trigger themselves — a commit triggers tests, a health check failure triggers a restart, a schedule triggers a backup.

The moment I scripted my daily log-rotation check, I stopped spending twenty minutes every morning on it. Automation scales that: instead of me running the script, a cron job or CI/CD pipeline does it, and alerts me only when something breaks. Without scripting and automation, I'd be doing ticket-level work forever instead of building systems.

## Key terminology

- **Script** — A short program written in a scripting language like Bash or Python. Example: a Bash script that checks disk usage and emails me if it exceeds 90%.
- **Shell** — The command-line interpreter that executes my scripts. Example: `bash` or `zsh`.
- **Cron** — A scheduler that runs scripts at fixed times or intervals. Example: `0 2 * * * /opt/scripts/backup.sh` runs a backup every night at 2 AM.
- **Pipeline** — A series of automated steps that run in order. Example: CI pipeline that lints, tests, builds, and deploys on every push.
- **Idempotency** — Running the same script multiple times produces the same result without side effects. Example: running `terraform apply` twice doesn't create duplicate resources.
- **Trigger** — An event that starts an automated task. Example: a GitHub webhook triggers a CI pipeline when I push code.
- **Variable** — A named value that makes scripts reusable. Example: `DB_HOST=prod-db.example.com ./run_migration.sh`.
- **Conditional** — A control structure that runs different code based on a test. Example: `if systemctl is-active nginx; then echo OK; fi`.

## A concrete example

```bash
#!/bin/bash
# check_disk.sh — alert if any mounted filesystem exceeds 90% usage
THRESHOLD=90
df -H | awk '{ print $5 " " $1 }' | while read output; do
  usage=$(echo "$output" | awk '{ print $1}' | sed 's/%//')
  partition=$(echo "$output" | awk '{ print $2 }')
  if [ "$usage" -ge "$THRESHOLD" ]; then
    echo "WARNING: Partition \"$partition\" is at ${usage}%"
  fi
done
```

This script parses disk usage, compares each mounted filesystem to a threshold, and prints a warning for any partition that exceeds 90%. It demonstrates parsing command output, conditional logic, and a loop — the core patterns I'll reuse in more complex automation.

## How this connects to what's next

Once I'm comfortable writing scripts, the next step is putting them into pipelines (CI/CD), orchestrating them with tools like Ansible, or wrapping them in Infrastructure as Code with Terraform. Every DevOps tool builds on the same foundation: if I can describe a task in a script, I can automate it.
