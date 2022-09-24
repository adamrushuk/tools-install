#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# Misc system utilities
sudo apt-get update -y
sudo apt-get install -y jq pv unzip tree
