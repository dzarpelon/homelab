# kind Cluster Runbook

## Goal

Create and validate a reproducible 3-node kind cluster for the homelab.

## Prerequisites

Run:

```bash
make prereqs
make ports
```

## Create the cluster

Run:

```bash
make create
```

This uses `infra/kind/kind-config.yaml`.

## Validate the cluster

Run:

```bash
make verify
```

Expected outcomes:

- `kubectl cluster-info` returns control-plane endpoints
- `kubectl get nodes` shows 3 Ready nodes
- `kubectl get pods -A` returns without API errors

## Tear down

Run:

```bash
make delete
```

