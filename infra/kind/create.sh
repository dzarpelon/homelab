#!/usr/bin/env bash
set -euo pipefail

if ! command -v docker >/dev/null 2>&1; then
  echo "Missing required command: docker" >&2
  exit 1
fi

if ! command -v kubectl >/dev/null 2>&1; then
  echo "Missing required command: kubectl" >&2
  exit 1
fi

current_context="$(kubectl config current-context 2>/dev/null || true)"
if [[ "$current_context" != "docker-desktop" ]]; then
  echo "Expected kube context 'docker-desktop', found '${current_context:-<none>}'." >&2
  echo "Switch Docker Desktop Kubernetes on and select the docker-desktop context first." >&2
  exit 1
fi

node_count="$(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d ' ')"
if [[ -z "$node_count" || "$node_count" -lt 3 ]]; then
  echo "Expected at least 3 nodes in the Docker Desktop cluster, found '${node_count:-0}'." >&2
  exit 1
fi

echo "Docker Desktop Kubernetes is active on context '$current_context' with $node_count nodes."
