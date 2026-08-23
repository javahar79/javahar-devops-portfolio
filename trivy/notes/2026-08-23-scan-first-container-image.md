---
last_verified: 2026-08-23
tool_version: n/a
sources: []
---

# Scan my first container image with trivy image

> First-day notes for running `trivy image` and reading the report.

## What I did

I pulled the official nginx image and scanned it:

```bash
trivy image nginx:latest
```

The output listed vulnerabilities grouped by severity — CRITICAL, HIGH, MEDIUM, LOW, UNKNOWN. Each entry shows the package name, installed version, fixed version (if available), and the vulnerability ID.

## What tripped me up

I expected to see zero issues on a well-maintained image. nginx:latest had several CRITICAL entries in the base OS packages — things I can't fix by changing my app code. The report also included a `Total: N` summary at the bottom that I almost missed. Scrolling past hundreds of lines of LOW-severity findings made it hard to spot the ones that actually mattered.

I tried `--severity HIGH,CRITICAL` to filter the noise:

```bash
trivy image --severity HIGH,CRITICAL nginx:latest
```

Much more readable. Only showed the findings I'd actually act on.

## What I learned

The `--format` flag lets me pipe results into other tools. `--format json` gave me a structured dump I could parse later, and `--format table` is the default human-readable view. I also discovered `--vuln-type os,library` lets me split OS-level packages from application dependencies — useful when I only care about what I installed in my Dockerfile.

## What I'll do next

I want to try scanning a local image I built (not just a public one) and see how the report differs. Then I'll wire this into a CI pipeline so every image gets scanned before push.
