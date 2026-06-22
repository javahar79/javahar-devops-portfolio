# Exploring the DevOps Automation repo

I opened the DevOps_Automation repo to see what's actually in it. This is the automation system that drives this whole portfolio, so I should understand its layout.

## What I found

Top level has: `Agent/`, `Docker/`, `Docker_opencode/`, `scripts/`, `.github/`, plus README and CHANGELOG.

The Agent directory is where all the logic lives. Each agent has its own prompt file under `Agent/prompts/` — there are prompts for level checking, research, task generation, auditing, promotion, and the worker agents. The state files like `TOOL_HIERARCHY.md`, `ACTIVE_BACKLOG_TASKS.md`, and `LEVEL_STATE.md` pass data between agents. I noticed `COMPLETED.md` has a history of finished tasks with PR numbers attached.

The `Docker/` and `Docker_opencode/` folders each have a Dockerfile and an `auto.sh` orchestrator script. Looks like the system runs inside a container with two variants — one using Kilo Code CLI and another using OpenCode.

`scripts/` has a `setup_customer.sh` that provisions customer branches and a `build_and_push_images.sh` for CI.

The README is thorough — eight agents run in sequence, each doing one thing, then the Worker creates PRs in the portfolio repo. The file structure section helped me map which files each agent owns.

## What tripped me up

The state_transfer directory under Agent/prompts/ was empty. Not sure if that's intentional or if it gets populated during runs.

I also wasn't sure at first whether to look at git history or just the files. The README answered most of my questions once I read it fully.

## What's next

Now that I understand the repo structure, I can see how tasks flow through the system. Next I want to check the actual task generation and promotion logic more closely.
