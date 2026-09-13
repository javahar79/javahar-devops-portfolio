---
last_verified: 2026-09-13
tool_version: n/a
sources: []
---

# Kustomize — quick primer

> First-day notes for someone who's never used Kustomize. Personal voice, plain language.

## What is it?

Kustomize is a template-free way to customize Kubernetes manifests. I kept running into the same problem with Helm: I'd have a base Deployment and just want to change the image tag or replica count for staging, but Helm's templating felt like overkill for that. Kustomize takes a different approach — instead of templates, it layers patches on top of existing YAML files. Think of it like CSS for Kubernetes configs: you have a base style, and then you override specific properties per environment.

It's built into `kubectl` as `kubectl apply -k`, so there's no separate binary to install if you're already on a recent Kubernetes version. That was the selling point for me — no new tool, no new syntax, just YAML on top of YAML.

## What does it do?

Kustomize lets you take a set of plain Kubernetes YAML files (your "base") and then create multiple Variants by applying overlays. An overlay is just a directory with a `kustomization.yaml` file that points at the base and lists patches. Want to change the container image for staging? Write a patch. Want to add a namespace to everything? Add it in the kustomization file. The `kustomize build` command merges everything together and outputs the final YAML that `kubectl` can apply.

## Why does it exist?

Before Kustomize, if you had three environments (dev, staging, prod) with nearly identical Kubernetes manifests, you either copy-pasted the YAML three times and drifted apart, or you used Helm templates with `{{ .Values.image }}` everywhere. Both approaches have real downsides: copy-paste diverges, and Helm adds a layer of abstraction that makes debugging harder. Kustomize sits in the middle — it keeps your base manifests as plain YAML (no template syntax to learn), and lets you express differences as overlays. Platform teams use it when they want environment-specific configs without giving up readability.

## Key terminology

- **Base** — The set of Kubernetes YAML files that define your core resources. Example: a directory with `deployment.yaml` and `service.yaml` for your app.
- **Overlay** — A directory that references a base and applies patches or modifications. Example: `overlays/staging/` changes the replica count from 1 to 3.
- **Kustomization** — The `kustomization.yaml` file that tells Kustomize which bases to merge and which patches to apply. Example: `resources: [../base]` plus `patches: [replica-patch.yaml]`.
- **Patch** — A small YAML file that targets a specific resource and changes one or more fields. Example: a JSON patch that sets `spec.replicas: 3`.
- **Strategic Merge Patch** — The default patching strategy in Kustomize that merges maps and replaces lists. Example: changing just the `image:` field in a container spec without rewriting the whole container definition.
- **Build** — The `kustomize build` command that combines base + overlays into a single YAML stream. Example: `kustomize build overlays/staging/` outputs the final manifest.

## A tiny example

```yaml
# kustomization.yaml (in an overlay directory)
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - ../base

patches:
  - target:
      kind: Deployment
      name: my-app
    patch: |
      - op: replace
        path: /spec/replicas
        value: 3
```

This overlay takes the base Deployment named `my-app` and overrides replicas to 3. Run `kustomize build .` to see the merged output.

## What I'll cover next

After this primer I want to write my first `kustomization.yaml` from scratch — create a base Deployment and then overlay an environment-specific variant with a different image tag and replica count. Then I'll play with `kustomize build` and `kustomize diff` to see what actually changes between overlays.
