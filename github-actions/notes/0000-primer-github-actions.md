# GitHub Actions — quick primer

> First-day notes for someone who's never used GitHub Actions. Personal voice, plain language.

## What is it?

GitHub Actions is a CI/CD platform built right into GitHub. If you already use GitHub to host your code, Actions is the automation engine that lives next to it — you define workflows as YAML files in your repo, and GitHub runs them on their servers (or your own runners) when events happen.

Think of it like cron jobs mixed with build scripts, but triggered by git events instead of time. Push code → tests run automatically. Open a PR → a linter checks your formatting. Tag a release → it builds and pushes a Docker image. All defined in a file checked into your repo alongside your code.

## What does it do?

It listens for GitHub events (push, pull_request, issue comment, schedule, etc.) and runs whatever commands you tell it to inside a fresh VM or container. You can run shell commands, install packages, run tests, deploy to servers, send notifications — basically anything you can do from a terminal.

## Why does it exist?

Before Actions, you either used a separate CI tool (Jenkins, Travis CI, CircleCI) that required its own setup and configuration outside your repo, or you manually ran tests and deployments. Actions makes CI/CD feel like part of your repository — the config lives in `.github/workflows/`, gets versioned with your code, and there's nothing external to set up for basic cases. It's especially nice for open-source projects because the free tier is generous (2000 minutes/month).

## Key terminology

- **Workflow** — The top-level automation unit. A YAML file in `.github/workflows/` that defines what event triggers it and what jobs to run. Example: `.github/workflows/lint.yml` runs lint on every push.
- **Job** — A set of steps that execute on the same runner. Jobs in a workflow run in parallel by default. Example: a "test" job and a "lint" job run at the same time.
- **Step** — A single task within a job (run a command or use an action). Example: `- run: npm test`.
- **Action** — A reusable unit of automation, like a plugin. You can use community actions from the Marketplace or write your own. Example: `actions/checkout@v4` checks out your repo so the workflow can access it.
- **Runner** — The server that executes the workflow. GitHub-hosted runners have Ubuntu, Windows, and macOS. You can also host your own.
- **Event** — What triggers the workflow. `push`, `pull_request`, `schedule` (cron), `workflow_dispatch` (manual trigger). Example: `on: [push]`.
- **Matrix** — A strategy to run a job across multiple configurations. Example: test on `node: [18, 20]` and `os: [ubuntu, macos]` in one job definition.

## A tiny example

```yaml
# .github/workflows/lint.yml
name: CI
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hello, Actions!"
```

This workflow triggers on every push, checks out the repo, and prints "Hello, Actions!" to the log. It's the CI equivalent of hello-world.

## What I'll cover next

Now that I know what GitHub Actions is, I want to set up a real CI workflow that runs tests and linting on my projects. After that, I'll explore the Actions UI to understand how workflow runs look and how to debug failures.
