#!/usr/bin/env bash
set -euo pipefail

kubectl cluster-info
echo
kubectl get nodes -o wide
echo
kubectl get pods -A

