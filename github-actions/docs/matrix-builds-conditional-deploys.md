---
last_verified: 2026-07-24
tool_version: "n/a"
---

# Matrix builds and conditional deploys in GitHub Actions

## Purpose

Matrix builds let you test across multiple OS and runtime combinations from a single workflow. Conditional deploys gate promotions behind branch, event, or status checks so that only validated artifacts reach production. Together they reduce duplication while keeping pipelines safe.

## When to use

- **Matrix builds** when your project supports multiple OS targets, language versions, or dependency configurations.
- **Conditional deploys** when you want automatic staging deploys but manual or gated production deploys, or when you need to skip deployment for pull request events.

## Prerequisites

- A GitHub repository with Actions enabled
- A workflow YAML file under `.github/workflows/`

## Steps

### 1. Define a build matrix

Use the `strategy.matrix` key to enumerate combinations:

```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node: [18, 20]
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm ci
      - run: npm test
```

This runs six jobs (3 OS × 2 Node versions) in parallel. The `matrix` context makes the current combination's values available in each job.

### 2. Exclude or include specific combinations

`exclude` removes unwanted pairs; `include` adds extras:

```yaml
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest]
    node: [18, 20]
    exclude:
      - os: windows-latest
        node: 18
    include:
      - os: ubuntu-latest
        node: 22
```

### 3. Add conditional deployment

Use `if:` with GitHub contexts to control when a deploy job runs:

```yaml
jobs:
  deploy-staging:
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    needs: test
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploy to staging..."

  deploy-production:
    if: github.ref == 'refs/heads/main' && github.event_name == 'push'
    needs: deploy-staging
    environment: production
    steps:
      - run: echo "Deploy to production..."
```

The `environment` keyword adds an approval gate for production when the environment requires reviewers.

### 4. Use `github.event_name` for event-sensitive logic

```yaml
- run: |
    if [[ "${{ github.event_name }}" == "pull_request" ]]; then
      echo "Skipping deploy for PR"
      exit 0
    fi
    ./deploy.sh
```

## Verify

1. Push the workflow to the default branch.
2. Navigate to the Actions tab — the matrix runs should appear as parallel jobs.
3. Trigger a PR push and confirm that conditional deploys are skipped.
4. Trigger a merge to `main` and confirm the deploy jobs fire in sequence.


