#!/usr/bin/env bash
set -euo pipefail

need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

need docker
need kubectl

if command -v kind >/dev/null 2>&1; then
  echo "Found optional command: kind"
else
  echo "Optional command not found: kind"
fi

if command -v helm >/dev/null 2>&1; then
  echo "Found optional command: helm"
else
  echo "Optional command not found: helm"
fi

echo "Prerequisites look good."
