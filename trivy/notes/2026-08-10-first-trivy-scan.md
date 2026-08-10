---
last_verified: 2026-08-10
tool_version: n/a
---

# Log my first Trivy vulnerability scan

> First-day notes for running my first Trivy scan. Personal voice, plain language.

## What I did

I built a small container image for a test web app and ran my first vulnerability scan against it. The terminal output showed findings grouped by severity. Most results came from the base image, while my own dependency had one HIGH-rated issue that I had missed during development.

## What tripped me up

I didn't expect the base image to generate so many results. Reading through dozens of LOW-severity entries was noisy. I found that narrowing the report to the higher severities made the output useful instead of overwhelming.

## What I'll do next

I want to try the filesystem scan mode next, and then add this check into a GitHub Actions workflow so every push is scanned before it merges.
