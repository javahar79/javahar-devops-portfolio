---
last_verified: 2026-08-14
tool_version: n/a
sources: []
---

# OpenTofu — official quickstart walkthrough

> Following the official OpenTofu quickstart end to end, and noting where it tripped me up.

## What I did

I started from the official quickstart, which walks through creating a config with the local provider, then `tofu init`, `tofu plan`, `tofu apply`, and finally `tofu destroy`. The whole flow is a file being created and then removed on my machine.

```hcl
resource "local_file" "example" {
  filename = "example.txt"
  content  = "hello from the quickstart"
}
```

```bash
tofu init
tofu plan
tofu apply
```

## What tripped me up

- **Plan output wants a human decision, not a yes.** `tofu apply` re-prints the plan and waits for `yes` before doing anything. I typed it the first time and realized the workflow is really "plan first, read the diff, then apply" — the apply is a confirmation step, not a silent runner.
- **State appears as a surprise file.** After the first apply a `terraform.tfstate` file showed up in the directory. It wasn't in my config; OpenTofu created it to remember what it owns. I hadn't expected state management to be this visible on a first run.
- **The quickstart has you modify the config and re-apply.** I changed the content string, ran `tofu plan` again, and the diff showed it would replace the file. Editing a resource and re-running the same cycle is the core loop, but it took me a second apply to internalize that plan/apply isn't a one-shot thing.
- **`tofu destroy` is separate, not an apply option.** The quickstart ends by tearing everything down with its own command. I kept looking for a "rollback" flag and missed that removal is its own lifecycle step.

## What I'll try next

Variables and outputs are the natural next step so the config stops being hardcoded. After that I want to hook a remote backend for state instead of the local file, then start on a real cloud resource.
