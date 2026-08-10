---
last_verified: 2026-08-10
tool_version: n/a
---

# Pulumi — quick primer

> First-day notes for someone who's never used Pulumi. Personal voice, plain language.

## What is it?

Pulumi is an Infrastructure as Code tool that lets you define cloud resources using real programming languages instead of YAML or HCL. I first heard about it coming from a Terraform background, and the idea that I could write `for` loops and `if` statements to generate infrastructure felt almost too good to be true. It supports Python, TypeScript, Go, and even YAML — so you pick whatever language your team already knows.

## What does it do?

You write a program that describes what resources you want — an S3 bucket, a Kubernetes namespace, a database — and Pulumi provisions them on the cloud provider of your choice. It tracks state so it knows what's already deployed, and on the next run it only changes what actually changed. I think of it as the difference between writing a shell script and writing a small app: you get variables, functions, and the whole toolchain of an existing language.

## Why does it exist?

Before Pulumi, IaC tools stuck to declarative config files. That's fine for a fixed set of resources, but the moment you need to repeat a pattern across regions or environments, you reach for templating hacks. Pulumi grew out of the frustration that infrastructure code was lagging behind application code — no type checking, no testing, no reuse. Developers and platform engineers use it now when they want to treat infrastructure like application code, leaning on their existing IDE and CI setup.

## Key terminology

- **Stack** — A named deployment target, like "dev" or "prod", each with its own config and state. Example: `pulumi stack init dev` creates a fresh stack.
- **Config** — Key-value settings per stack that let the same program behave differently without code changes. Example: `pulumi config set aws:region us-west-2`.
- **Resource** — A single cloud object Pulumi manages, such as an S3 bucket or a Kubernetes pod. Example: `s3.Bucket("data")` registers one bucket.
- **Provider** — The plugin that talks to a specific cloud API (AWS, Azure, GCP, Kubernetes). Example: the AWS provider is how Pulumi knows how to create AWS resources.
- **State** — The record of what Pulumi last provisioned, used to compute the diff on the next run. Example: after `pulumi up`, state lives in the Pulumi Service backend by default.

## A tiny example

```python
import pulumi
from pulumi_aws import s3

# Create a single S3 bucket and export its name
bucket = s3.Bucket("my-first-bucket")
pulumi.export("bucket-name", bucket.id)
```

This program defines one AWS S3 bucket. Running `pulumi up` provisions it; `pulumi rm` tears it down.

## What I'll cover next

After this primer, I want to write my first real Pulumi program in Python — creating a small resource and inspecting the deployed result — and then play with stack configuration so I can understand how the same code targets different environments.
