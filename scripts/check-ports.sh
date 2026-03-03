#!/usr/bin/env bash
set -euo pipefail

check_port() {
  local port="$1"

  if lsof -nP -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1; then
    echo "Port $port is already in use:"
    lsof -nP -iTCP:"$port" -sTCP:LISTEN
    return 1
  fi

  echo "Port $port is available."
}

check_port 80
check_port 443

