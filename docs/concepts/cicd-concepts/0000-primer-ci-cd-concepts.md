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

CI/CD is the practice of merging developer code changes into a shared repository frequently and automatically running builds, tests, and releases on every change. I think of it as the automation layer between writing code and users actually getting that code. Continuous Integration (CI) means I push small changes often, and every push triggers an automated build and test cycle. Continuous Delivery (CD) means the code is always in a state where it could be released to users. Continuous Deployment takes it further — every passing change goes live automatically without waiting for manual approval.

## Why does it matter for DevOps?

CI/CD is the technical backbone of DevOps culture. It converts "ship frequently and safely" into actual automation. Without it, every deploy is a manual, error-prone ceremony involving hand-offs between teams. With CI/CD, I push code and within minutes it's tested and optionally live to users. DORA metrics — deployment frequency, lead time for changes, change failure rate, and MTTR — gauge how well a team's pipeline performs. Skipping CI/CD means slow releases, "it works on my machine" problems, and bugs that slip through because there's no automated safety net.

## Key terminology

- **Pipeline** — An automated sequence from commit to deploy. Example: A GitHub Actions workflow triggered on every push that runs lint, test, and build steps in order.
- **Stage** — A grouping of related jobs. Example: A "test" stage runs unit and integration tests; a "build" stage compiles the application.
- **Job** — A single unit of work within a stage. Example: A job that executes `npm test` on a clean runner.
- **Trigger** — What starts the pipeline. Example: A `push` to main, a `pull_request`, or a scheduled nightly run.
- **Artifact** — A file produced by one step and passed downstream. Example: A compiled binary, Docker image, or test report.
- **Continuous Integration (CI)** — Merging changes frequently with automated builds and tests on every change. Example: Pushing a bug fix triggers tests that catch a regression before merge.
- **Continuous Delivery (CD)** — Ensuring every change can be released to production at any time with a manual deploy step. Example: Tests pass → artifact is staged → someone clicks "deploy to prod."
- **Continuous Deployment** — Every passing change auto-deploys to production without manual approval. Example: A passing pipeline automatically ships a new version to users.

## A concrete example

A developer pushes a bug fix to a GitHub repository. A GitHub Actions workflow triggers on that push. The pipeline has three stages: lint (checks code style), test (runs unit and integration tests), and build (creates a Docker image and pushes it to a registry). If the lint or test stage fails, the pipeline stops and the developer gets an email with the failure logs. If everything passes, the built image is available for deployment. A second workflow, triggered manually, deploys that image to a staging environment for final review. This entire flow — from push to deployable artifact — happens without any manual intervention in between.

## How this connects to what's next

CI/CD concepts lead directly to learning specific tools like GitHub Actions or Jenkins for implementation, and then to deployment strategies like blue-green or canary releases on Kubernetes. Once I understand the pipeline pattern, learning a specific CI tool is just learning the syntax for the same underlying stages.
