---
last_verified: 2026-09-13
tool_version: n/a
sources: []
---

# Explore the Pulumi CLI

Today I actually ran the Pulumi CLI commands instead of just reading about them. Here's what I did.

## stack init

First I created a new stack called `dev`:

```bash
pulumi stack init dev
```

It asked me to select a backend — I went with the Pulumi Cloud (free tier). The command created a `Pulumi.dev.yaml` file in my project directory. That file holds the stack-specific config.

## preview

Before deploying anything, I ran `pulumi preview` to see what would happen:

```bash
pulumi preview
```

It showed me the diff — one S3 bucket to create. The output looked a lot like `terraform plan`: resources to add, modify, or delete. Good sanity check before actually provisioning.

## up

Then I pulled the trigger:

```bash
pulumi up
```

It asked for confirmation, showed the plan again, and then provisioned the bucket. Took about 10 seconds. The output gave me the bucket ARN and the exported value I defined in code.

## destroy

Finally, I tore it all down:

```bash
pulumi destroy
```

Same confirmation flow. It showed what would be deleted, I confirmed, and the bucket was gone. State was cleaned up on the backend too.

## What I noticed

The CLI feels very similar to Terraform — init/plan/apply/destroy mapped to stack init/preview/up/destroy. The main difference is that Pulumi doesn't have a separate `init` for providers; installing `pulumi_aws` via pip was enough. Stack state lives on the Pulumi Cloud by default, which means no local `.tfstate` file to manage.
