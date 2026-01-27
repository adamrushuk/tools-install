#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# Misc system utilities
# wslu is a set of utilities for WSL to improve integration with Windows
# - required so Azure CLIs can open browser windows for login
sudo apt-get update -y
sudo apt-get install -y jq pv unzip tree wslu
