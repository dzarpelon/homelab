#!/usr/bin/env bash
set -euo pipefail

need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

need docker
need kind
need kubectl

if command -v helm >/dev/null 2>&1; then
  echo "Found optional command: helm"
else
  echo "Optional command not found yet: helm"
fi

echo "Prerequisites look good."

