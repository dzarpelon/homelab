#!/usr/bin/env bash
set -euo pipefail

echo "== Host =="
uname -a
echo

echo "== Docker =="
docker version --format 'client={{.Client.Version}} server={{.Server.Version}}'
echo

echo "== kubectl =="
kubectl version --client
echo

echo "== Kube Context =="
kubectl config current-context
