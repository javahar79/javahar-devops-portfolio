---
last_verified: 2026-08-06
tool_version: n/a
sources:
  - https://majesticops.com/blog/devops-roadmap-for-beginners
---

# Jenkins — quick primer

> First-day notes for someone who's never used Jenkins. Personal voice, plain language.

## What is it?

I learned that Jenkins is an open-source automation server for building, testing, and deploying code. I think of it as a conveyor belt — when someone pushes new code, Jenkins picks it up, runs tests, and deploys it.

## What does it do?

I found that Jenkins listens for events like code pushes or pull requests, then runs steps — compiling code, running tests, packaging artifacts, and deploying to servers. It organizes steps into pipelines so the process is repeatable.

## Why does it exist?

Before Jenkins, teams had to manually build, test, and deploy code. This was slow and inconsistent — different developers might deploy differently. Jenkins automates that workflow so every change goes through the same steps.

## Key terminology

- **Pipeline** — a defined sequence of steps Jenkins follows. Example: a Jenkinsfile that says "checkout code → run tests → build image → deploy."
- **Job** — a single unit of work Jenkins runs. Example: a Jenkins job that runs `npm test` on every push.
- **Agent** — a machine or container where Jenkins executes pipeline steps. Example: a Jenkins agent running in Docker that builds code in isolation.

## A tiny example

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
    }
}
```

A minimal Jenkins pipeline that prints "Building..." and "Testing..." in two stages.

## What I'll cover next

I want to try installing Jenkins locally and running the web UI for the first time. After that, I'll explore writing a real pipeline that actually builds and tests something.