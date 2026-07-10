---
last_verified: 2026-07-10
tool_version: n/a
---

# Reading GitHub Actions workflow logs and debugging failures

I ran my first workflow yesterday and it failed on the second step. Here's how I learned to read the logs and figure out what went wrong.

## Finding the logs

After pushing a commit, I went to the Actions tab in the repo. The failed run shows up with a red X. Clicking it shows the workflow summary — which jobs ran and whether each passed or failed.

I clicked on the failed job, then the failed step. The log output for that step expanded inline. At the top of the log there's a timestamp and the runner image info (ubuntu-latest, etc.). Scrolling down, I could see the exact command that ran and its stdout/stderr.

## What I looked for

The log line that matters is usually near the bottom of the failed step. GitHub Actions prints a red `Error:` line with the exit code. In my case, the step was trying to run a script that referenced a file that didn't exist:

```
Run ./deploy.sh
  ./deploy.sh
  shell: /usr/bin/bash --noprofile --norc -e -o pipefail
Error: Process completed with exit code 127.
```

Exit code 127 means "command not found." The script wasn't in the workspace because I'd forgotten the `actions/checkout@v4` step before it.

## Debugging tricks

- **Re-run with debug logging**: From the workflow run page, the "Re-run jobs" dropdown has an option to enable debug logging. That sets `ACTIONS_STEP_DEBUG=true` and `ACTIONS_RUNNER_DEBUG=true`, which prints extra info about how the runner resolves actions and sets up the environment.
- **Add a step to dump context**: I inserted a one-off step with `run: env` to print all environment variables and verify my secrets and variables were set correctly.
- **Inspect the file system**: Adding `run: ls -la ${{ github.workspace }}` shows what files actually made it into the runner.
- **Workflow dispatch for fast iteration**: I switched the trigger to `workflow_dispatch:` so I could re-trigger from the UI without pushing a new commit each time.

## What I'd try next

- Set up a matrix strategy and see how logs differ across OS versions
- Use `actions/upload-artifact` to persist test reports and inspect them after the run
- Try the `needs:` dependency syntax to see how failure in an upstream job cascades
