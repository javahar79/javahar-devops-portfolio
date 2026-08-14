#!/usr/bin/env python3
# last_verified: 2026-08-14 · python n/a
"""Cloud infrastructure pattern: environment-as-code consistency.

This script demonstrates a pattern that shows up constantly in real DevOps
projects: environments (dev, stage, prod) must be described by the same code
and differ only in configuration, never in structure. It models each
environment as a small declarative definition and validates the set for
*structural parity* — the same components present across environments — which
is the drift check a pipeline would run before promoting a change.

Run:  python3 infrastructure-patterns.py
Exits 0 when all environments are structurally consistent, 2 on drift.
No cloud SDK required — the pattern is about the shape of the data.
"""

from __future__ import annotations

import sys
from dataclasses import dataclass, field
from typing import Dict, List

# The "cloud layout" every environment must agree on. Keys are component
# names, values are the resource type that component must be described as.
REQUIRED_LAYOUT: Dict[str, type] = {
    "compute": dict,      # VM / instance group / serverless function
    "network": dict,      # VPC, subnets, security groups
    "storage": dict,      # object storage, volumes, buckets
    "database": dict,     # managed or self-hosted data store
    "iam": dict,          # service accounts, roles, policies
}


@dataclass
class Environment:
    """One environment's declarative definition (what IaC would render)."""

    name: str
    components: Dict[str, dict] = field(default_factory=dict)


def missing_components(env: Environment) -> List[str]:
    """Return the required components an environment does not declare."""
    return [name for name in REQUIRED_LAYOUT if name not in env.components]


def extra_components(env: Environment) -> List[str]:
    """Return components an environment declares that the layout does not.

    An unknown component is usually a sign the environment drifted from the
    shared template (someone added a one-off resource to prod only).
    """
    return [name for name in env.components if name not in REQUIRED_LAYOUT]


def is_consistent(environments: List[Environment]) -> bool:
    """Structural parity check: every env declares every required component."""
    return all(not missing_components(env) for env in environments)


def structural_difference(a: Environment, b: Environment) -> List[str]:
    """List the structural differences between two environments."""
    diff = []
    for name in REQUIRED_LAYOUT:
        in_a, in_b = name in a.components, name in b.components
        if in_a != in_b:
            diff.append(
                f"{name}: present in {a.name}={in_a}, {b.name}={in_b}"
            )
    return diff


def report(environments: List[Environment]) -> None:
    """Human-readable drift summary, one block per environment."""
    for env in environments:
        missing = missing_components(env)
        extra = extra_components(env)
        print(f"{env.name}:")
        for component, spec in env.components.items():
            print(f"  - {component}: {len(spec)} attribute(s)")
        if missing:
            print(f"  MISSING components: {', '.join(missing)}")
        if extra:
            print(f"  UNEXPECTED components: {', '.join(extra)}")


def main() -> int:
    # Three environments rendered from the same template: identical structure,
    # values scaled per stage. This is the consistency a promotion depends on.
    dev = Environment(
        name="dev",
        components={
            "compute": {"instances": 1, "family": "small"},
            "network": {"cidr": "10.0.0.0/24"},
            "storage": {"size_gb": 10, "tier": "standard"},
            "database": {"engine": "postgresql", "version": "unmanaged"},
            "iam": {"roles": ["app-dev"]},
        },
    )
    stage = Environment(
        name="stage",
        components={
            "compute": {"instances": 1, "family": "medium"},
            "network": {"cidr": "10.0.1.0/24"},
            "storage": {"size_gb": 50, "tier": "standard"},
            "database": {"engine": "postgresql", "version": "unmanaged"},
            "iam": {"roles": ["app-stage"]},
        },
    )
    prod = Environment(
        name="prod",
        # Deliberately missing "iam" and carrying an extra "cache" component —
        # a one-off someone added to prod only. This is the drift the pattern
        # exists to catch before it becomes a half-day incident.
        components={
            "compute": {"instances": 3, "family": "large"},
            "network": {"cidr": "10.0.2.0/24"},
            "storage": {"size_gb": 200, "tier": "premium"},
            "database": {"engine": "postgresql", "version": "unmanaged"},
            "cache": {"engine": "valkey", "shards": 2},
        },
    )

    environments = [dev, stage, prod]
    report(environments)

    print("\n-- Checking structural parity across environments --")
    for left, right in [("dev", "stage"), ("stage", "prod")]:
        a = next(e for e in environments if e.name == left)
        b = next(e for e in environments if e.name == right)
        diffs = structural_difference(a, b)
        status = "OK" if not diffs else "DRIFT"
        print(f"{left} vs {right}: {status}")
        for line in diffs:
            print(f"    {line}")

    if not is_consistent(environments):
        print("\nResult: environment drift detected — fix before promoting.")
        return 2
    print("\nResult: environments structurally consistent.")
    return 0


if __name__ == "__main__":
    sys.exit(main())