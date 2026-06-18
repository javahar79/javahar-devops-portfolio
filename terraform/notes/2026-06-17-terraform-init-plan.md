# Terraform init and plan — first run

Following up on the install script, I ran `terraform init` and `terraform plan` to see what happens.

## Steps

1. Created a test directory and added the local provider config
2. Ran `terraform init` - it downloaded the local provider plugin
3. Ran `terraform plan` - it showed what would be created

## What I tried

```bash
cd ~/tf-test && terraform init
terraform plan
```

Init downloaded the provider and created `.terraform.lock.hcl`. Plan showed:

```
  # local_file.greeting will be created
  + resource "local_file" "greeting" {
      + content  = "hello from terraform"
      + filename = "./greeting.txt"
    }
```

## Gotchas

- `terraform init` must run in the same directory as the .tf file
- Plan output is clean - just shows what will change
- No real resources were created during plan (safe to run)