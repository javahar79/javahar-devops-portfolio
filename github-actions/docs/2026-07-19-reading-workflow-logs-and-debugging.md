---
last_verified: 2026-07-19
tool_version: n/a
---

# Reading GitHub Actions workflow logs and debugging failures

My first real workflow run failed on the deploy step. Here's how I walked through the logs and what I learned about debugging.

## Step 1 — Find the failed run

After pushing, I opened the repo's Actions tab. The latest run had a red X next to it. Clicking the run shows the workflow graph — each job is a box, green or red. The failed job was obvious. Clicking it expands the job into individual steps, and the step that failed had a red icon.

I clicked the failed step and the log pane opened. The first thing I noticed was a timestamp and the runner image info (`ubuntu-24.04`). That matters — I was testing on macOS locally but the runner uses Ubuntu. A path like `/Users/me/project/config.yaml` worked locally but the runner expected `/home/runner/work/repo/config.yaml`.

## Step 2 — Read the error near the bottom

The last few lines of the log are usually where the exit code lives. In my case:

```
Run ./deploy.sh
  ./deploy.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail
Error: Process completed with exit code 127.
```

Exit code 127 means "command not found." I'd assumed the script would be in the workspace, but I'd forgotten `actions/checkout@v4` — without it, the runner has no repo files.

I added `actions/checkout@v4` as the first step and re-ran. Same exit code. Turns out the script used `jq` which isn't pre-installed on Ubuntu runners. I added `run: sudo apt-get install -y jq` before the script step.

## Step 3 — Enable debug logging for more detail

From the workflow run page, the re-run menu has "Re-run with debug logging." This sets `ACTIONS_STEP_DEBUG=true` and `ACTIONS_RUNNER_DEBUG=true`. The extra output shows which cache keys were used, how composite actions resolved, and where the runner looked for each tool.

I used this when a composite action step was failing silently — the debug log showed it couldn't find a file at the expected relative path.

## Step 4 — Dump environment to verify inputs

I added a one-off step early in the workflow:

```yaml
- name: Debug
  run: |
    env | sort
    echo "---"
    echo "workspace: ${{ github.workspace }}"
    echo "branch: ${{ github.ref_name }}"
    ls -la ${{ github.workspace }}
```

This showed me my repository variables were set correctly and confirmed the workspace had the files I expected. The `ls` output revealed a subdirectory structure I hadn't accounted for in my path references.

## Step 5 — Iterate fast with workflow_dispatch

I changed the trigger to `workflow_dispatch:` so I could re-trigger from the UI without pushing a new commit for each fix. Combined with debug logging, this cut the iteration cycle from ~2 minutes to ~30 seconds per attempt.

## What I'd try next

- Use `needs:` to make jobs conditional and test how failure in one job affects downstream jobs
- Add `actions/upload-artifact` to persist test reports and inspect them after a run
- Set up a matrix strategy to compare behavior across Ubuntu, macOS, and Windows runners
