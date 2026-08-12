---
last_verified: 2026-08-12
tool_version: n/a
sources:
  - https://github.com/javed97/gitops-argocd-eks
  - https://github.com/ibraheemcisse/aws-terraform-platform
---

# Combining Infrastructure as Code with CI/CD — automated provisioning pipeline

## Purpose

This doc sketches one way to combine Infrastructure as Code (IaC) with a CI/CD
pipeline so that infrastructure changes flow through the same review-and-approve
workflow as application changes. The pattern is an automated provisioning
pipeline: a CI system runs `terraform plan` on every pull request, and `terraform
apply` only runs behind a manual approval gate after code review. It answers the
question "how does the platform itself get delivered?" without giving a CI runner
free rein over every environment.

## Why combine the two lifecycles

IaC state is long-lived and slow to recover — a bad `apply` can take down shared
infrastructure that many teams depend on. Application changes, by contrast, are
fast to roll back. Wiring IaC into CI/CD deliberately lowers the blast radius:
every proposed infrastructure change becomes a reviewable diff, and nothing
touches real environments until a human approves it.

Two claims worth carrying forward:

- A common real-world setup has the CI workflow run `terraform plan` on every PR
  and `terraform apply` behind a manual approval gate on merge, with remote state
  in S3 and DynamoDB locking so concurrent applies cannot corrupt the state.
- A production-grade example wireup maps every decision to a Well-Architected
  pillar, including approval gates on every `terraform apply`.

## Structure of the pipeline

A typical automated provisioning pipeline has four stages:

1. **Plan on every PR.** The pipeline runs `terraform plan` (or `tofu plan`) and
   posts the diff as a PR comment. This gives reviewers a preview of what would
   change before they approve anything.
2. **Approve.** A maintainer or platform team reviews the diff and approves the
   change. The approval gate is usually a manual step in the workflow.
3. **Apply on merge.** Once the PR merges, the pipeline runs `terraform apply`.
   Because this step is gated, an accidental or un-reviewed change cannot reach
   shared infrastructure silently.
4. **State safety.** The apply writes to remote state and acquires a state lock
   so that two concurrent applies cannot clobber each other.

## State and locking are the non-negotiable part

The pipeline is only as safe as its state handling. Keeping state remotely (object
storage such as S3) and locking it (a key-value store such as DynamoDB) means a
CI runner that dies mid-apply does not leave half-finished infrastructure behind,
and a second PR cannot apply while the first is still running. Without locking,
two parallel pipelines can both believe they own the state, and the last writer
wins — often destructively.

## A realistic first-apply gotcha

On freshly-created accounts, a first `terraform apply` against managed services
sometimes fails with an access-denied error even though permissions look correct,
because a service-linked role has not been created yet. Creating that role is a
classic first-run step, and it comes up precisely because the pipeline runs in
its own isolated CI identity rather than a human's.

## When this pattern fits

The plan-on-PR / apply-on-merge pipeline pays off most when infrastructure and
application changes share a repository or a release cadence. If platform changes
happen rarely, a separate platform pipeline with looser coupling to the app
pipeline may be simpler — the plan/approve/apply structure still applies either
way.

## Verify

1. Open a PR that touches an IaC file and confirm the workflow runs a plan and
   shows a diff.
2. Try to merge without approving and confirm the apply does not run.
3. Run two applies simultaneously against the same state and confirm the second
   blocks on the state lock.
4. After an approved apply, run `terraform plan` again and confirm an empty diff
   (idempotence).