# Exploring the DevOps Automation repo

Started poking around the DevOps_Automation repo to see what's actually in there. It's the engine that generates this portfolio — so understanding it helped me make sense of all the files.

## What I found

The root has a README that explains the whole thing. Eight AI agents run in sequence inside a Docker container each cycle. Each agent has one job and passes state to the next via files in the `Agent/` directory.

The `Agent/` folder has the state files — `TOOL_HIERARCHY.md`, `LEVEL_STATE.md`, `ACTIVE_BACKLOG_TASKS.md`, `CYCLE_STATE.md`, `RESEARCH_FINDINGS.md`, etc. These are read and written by different agents as they run.

There's also `Docker/` and `Docker_opencode/` directories — looks like the container images for the two runtimes (kilo and opencode variants). A `.github/` workflows folder for CI. And `scripts/` with helper scripts like `setup_customer.sh`.

## What stood out

The system is role-agnostic — same pipeline can produce a DevOps Kit or a Python Kit. The `Role: devops` in `TOOL_HIERARCHY.md` tells the agents what domain vocabulary to use.

I can see how my portfolio files get generated: Agent 03 writes tasks, Agent 06 (Worker) picks them up and creates the files, then publishes through PRs. The portfolio is designed to look like real human learning progression — L1 notes are scratchy, L5+ starts looking professional.

## One thing that tripped me up

At first I thought "DevOps Automation" was a separate thing from the portfolio. Took me a minute to realize it's the automation *pipeline* and the portfolio is the *output*. The repo name tells you what it does, not what it is.
