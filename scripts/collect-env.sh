#!/usr/bin/env bash
set -euo pipefail

echo "== Host =="
uname -a
echo

echo "== Docker =="
docker version --format '{{.Client.Version}}'
echo

echo "== kind =="
kind version
echo

echo "== kubectl =="
kubectl version --client

