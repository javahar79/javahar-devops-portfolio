# GitHub Actions UI — first look

I pushed a workflow file to a test repo and went to the Actions tab in GitHub to see what happened.

The UI has three main sections:

1. **Left sidebar** — lists all workflows defined in the repo. Each workflow gets its own entry. I saw my "CI" workflow show up after the first push.

2. **Main list** — shows recent workflow runs with status icons (green check, yellow circle, red X). Each run links to its detail page.

3. **Run detail page** — shows the commit that triggered it, the jobs in the run, and each job's steps. I clicked into a failed run and saw exactly which step errored and the full log output.

Got stuck for a minute trying to re-run a failed job — turns out there's a "Re-run all jobs" button in the top right of the run page.

I also noticed the "workflow_dispatch" trigger lets me manually start a workflow from the UI with a button. That's handy for one-off tasks.
