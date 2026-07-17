---
last_verified: 2026-07-17
tool_version: n/a
sources:
  - https://devops.com/a-beginners-guide-to-ci-cd-and-ci-cd-pipelines/
  - https://octopus.com/devops/ci-cd/
  - https://birjob.com/blog/cicd-pipeline-guide
---

# CI/CD Concepts — quick primer

> First-day notes on CI/CD Concepts. What it is, why it matters, and the key ideas to know.

## What is it?

I think of CI/CD as the automation layer between writing code and users getting it. Continuous Integration (CI) means I merge changes into a shared repo early and often, with automated builds and tests running on every change. Continuous Delivery (CD) means the code is always in a releasable state, ready for a manual deploy. Continuous Deployment goes one step further — every passing change auto-ships without human approval.

## Why does it matter for DevOps?

CI/CD is the technical backbone of DevOps culture. It converts "ship frequently and safely" into actual automation. Without it, every deploy is a manual, error-prone ceremony. With it, I push code and within minutes it's tested and optionally live to users. DORA metrics — deployment frequency, lead time for changes, change failure rate, and MTTR — gauge how well a team's CI/CD pipeline performs.

## Key terminology

- **Pipeline** — An automated sequence from commit to deploy. Example: A GitHub Actions workflow triggered on every push.
- **Stage** — A grouping of related jobs like build, test, or deploy. Example: A "test" stage runs unit and integration tests.
- **Job** — A single unit of work that runs on a runner. Example: A job that executes `npm test`.
- **Runner/Agent** — The machine that executes the pipeline. Example: `ubuntu-latest` hosted runner on GitHub Actions.
- **Artifact** — A file produced by one step and passed downstream. Example: A compiled binary or test report.
- **Trigger** — What starts the pipeline. Example: A `push` to main, a `pull_request`, or a scheduled cron.
- **CI vs CD** — CI verifies code before merge; CD handles release. Example: CI runs tests on every PR; CD deploys to staging after merge.

## A concrete example

A GitHub Actions workflow triggers on `push` to `main`. It checks out code, installs dependencies, runs tests (CI), builds a Docker image, and pushes it to a registry. If all steps pass, a second workflow deploys the new image to a staging cluster (CD). A broken commit is caught in the test stage before it reaches users.

## How this connects to what's next

CI/CD concepts lead directly to GitHub Actions and Jenkins for implementation, and then to deployment strategies like blue-green or canary releases on Kubernetes. Once I understand the pipeline pattern, learning a specific CI tool is just syntax.
