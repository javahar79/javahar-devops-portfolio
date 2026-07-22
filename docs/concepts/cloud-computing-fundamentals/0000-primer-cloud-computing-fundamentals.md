---
last_verified: 2026-07-22
tool_version: n/a
---

# Cloud Computing Fundamentals — quick primer

> First-day notes on Cloud Computing. What it is, why it matters, and the key ideas to know.

## What is it?

Cloud computing means renting compute, storage, and networking from a provider (AWS, Azure, GCP) instead of buying and racking physical servers. I provision what I need through an API, pay for what I use, and scale up or down in minutes. It's like switching from owning a car to using a ride-hailing service.

## Why does it matter for DevOps?

DevOps and cloud computing evolved together. Without cloud APIs, provisioning a test environment meant submitting a ticket and waiting weeks. With the cloud, I script infrastructure creation in a pipeline, tear down review environments after a PR merges, and run load tests against realistic specs without buying hardware.

## Key terminology

- **IaaS** — Raw compute, storage, networking. I manage the OS and app. AWS EC2, GCP Compute Engine.
- **PaaS** — Provider manages the OS and runtime; I just deploy code. Heroku, AWS Elastic Beanstalk.
- **SaaS** — Fully managed app I access over the web. Gmail, GitHub, Slack.
- **Region** — A geographic area with multiple data centers. Choosing one close to users reduces latency (e.g., `us-east-1`, `eu-west-1`).
- **Multi-cloud** — Using more than one provider to avoid vendor lock-in.

## A concrete example

```bash
aws ec2 describe-instances --region us-east-1 --query 'Reservations[*].Instances[*].[InstanceId,State.Name]' --output table
```

This queries the AWS API and returns a table of instance IDs and states. Entire infrastructure is accessible through CLI, SDK, or IaC — no web console required.

## How this connects to what's next

Cloud fundamentals underpin Terraform and Pulumi (which provision cloud resources) and Prometheus (which monitors cloud workloads). Understanding the service models makes the IaC tooling make sense.
