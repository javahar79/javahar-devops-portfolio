---
last_verified: 2026-08-12
tool_version: n/a
---

# First workflow run and the Actions tab

I pushed my first `.github/workflows/` file today and watched a run go through the Actions tab for the first time.

## What I did

I dropped a tiny workflow file into a dummy repo, set it to trigger `on: push`, and pushed. Then I clicked the Actions tab and watched it happen.

## What I saw

- The tab lists workflows on the left and individual runs in the middle. My run showed up as `queued`, then `in progress`, then a green checkmark.
- Clicking a run opened a detail page with the jobs, and each job expanded into its steps. Each step has its own log — I could see exactly which line ran and what it printed.
- I broke a step on purpose (a typo in a command) and the run turned red at that exact step. The failed log entry was highlighted, which made the cause obvious.
- There's a "Re-run" button on finished runs, so I can retry without another push.

## Where I want to go next

Now that I can read a run start to finish, I want to add a second job with `needs:` so I can see job ordering, and try `workflow_dispatch` so I can kick off a run by hand.