# Exploring the DevOps Automation repo

I poked around `/work/DevOps_Automation` to see what's in there. Here's what I found.

## Structure

The repo has a few key parts:
- **Agent/** — state files and prompts for a multi-agent pipeline. Files like `TOOL_HIERARCHY.md`, `ACTIVE_BACKLOG_TASKS.md`, `QUALITY_SIGNAL.md` track tool levels, tasks, and quality scores.
- **Docker/** and **Docker_opencode/** — two container variants (kilo CLI and opencode CLI) with entrypoint scripts and orchestration.
- **scripts/** — `setup_customer.sh` and `create_template_devops.sh` for provisioning.
- **.github/workflows/** — scheduled and manual GitHub Actions to build the Docker images.

## How it works

Eight agents run in sequence inside a container. Each has one job — level checking, research, task generation, auditing, promotion, implementation, maintenance. Agents pass data through shared state files. Agent 06 (Worker) is the one that writes to the output portfolio repo.

Agent 02 (Researcher) discovers what tools belong to the role on first run. For a devops role it picks up Docker, Kubernetes, Terraform, Ansible, etc. The same system could produce a Python or Java kit just by changing the Role: hint.

## What I'm seeing right now

I'm running as Agent 06. The pipeline picked docker-001, docker-002, and gen-005 from the ACTIVE list. The CYCLE_STATE.md says cycle 19.

I still don't fully understand how the level gate works or what triggers the Maintainer (agent 07) — that runs every 10 cycles. Need to read more.
