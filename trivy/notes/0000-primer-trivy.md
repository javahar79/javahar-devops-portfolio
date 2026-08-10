---
last_verified: 2026-08-10
tool_version: n/a
---

# Trivy — quick primer

> First-day notes for someone who's never used Trivy. Personal voice, plain language.

## What is it?

Trivy is an open-source vulnerability scanner developed by Aqua Security. It inspects container images, virtual machine disk images, filesystem directories, and Git repositories for security issues. I think of it as a diagnostic tool that sits between "I built this image" and "I'm ready to ship it" — it catches problems that would otherwise slip through.

## What does it do?

Trivy looks inside a container image and compares every installed package against a database of known vulnerabilities. It also checks Dockerfiles and Kubernetes manifests for insecure settings, like running a process as root or exposing sensitive ports. If it finds a secret hiding in a config file, it flags that too. The output is a plain-text report I can read in the terminal or save as JSON for a dashboard.

## Why does it exist?

Before scanners like Trivy became common, teams discovered vulnerabilities by accident — usually after an audit or a breach. You'd build an image, push it to a registry, and only later realize it contained an old library with a published exploit. Trivy shifts that discovery left, right into the build pipeline. Developers and platform engineers use it in CI so that vulnerable images never reach staging environments.

## Key terminology

- **Vulnerability** — A weakness in software that an attacker can exploit. Example: an outdated OpenSSL package with a known remote-code-execution flaw.
- **Misconfiguration** — A setting that weakens security without involving a code bug. Example: a container that mounts the host filesystem read-write.
- **Secret** — Hardcoded credentials such as API keys, tokens, or passwords found in source code or config files. Example: an AWS access key left in a `.env` file committed to Git.
- **SBOM** — Software Bill of Materials, a complete inventory of every component inside an image. Example: Trivy can generate an SBOM so compliance teams know exactly what shipped.
- **Severity** — The risk level assigned to a finding, typically CRITICAL, HIGH, MEDIUM, LOW, or UNKNOWN. Example: a remote-code-execution bug is usually CRITICAL, while a verbose log setting might be LOW.

## A tiny example

```bash
trivy image nginx:alpine
```

This command pulls the `nginx:alpine` image if it is not already local, scans it, and prints a table of vulnerabilities grouped by severity.

## What I'll cover next

After this primer, I want to run my first scan against an image I built myself and learn how to filter out false positives. I also want to try Trivy's filesystem mode so I can scan my application source before it ever becomes a container image.
