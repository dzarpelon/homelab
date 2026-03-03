#!/usr/bin/env bash
set -euo pipefail

current_context="$(kubectl config current-context 2>/dev/null || true)"
if [[ "$current_context" != "docker-desktop" ]]; then
  echo "Expected kube context 'docker-desktop', found '${current_context:-<none>}'." >&2
  exit 1
fi

node_count="$(kubectl get nodes --no-headers | wc -l | tr -d ' ')"
if [[ -z "$node_count" || "$node_count" -lt 3 ]]; then
  echo "Expected at least 3 nodes, found '${node_count:-0}'." >&2
  exit 1
fi

not_ready="$(kubectl get nodes --no-headers | awk '$2 !~ /^Ready/ { print $1 }')"
if [[ -n "$not_ready" ]]; then
  echo "Some nodes are not Ready:" >&2
  echo "$not_ready" >&2
  exit 1
fi

echo "Cluster preflight passed for context '$current_context' with $node_count Ready nodes."
echo
kubectl cluster-info
echo
kubectl get nodes -o wide
echo
kubectl get pods -A
