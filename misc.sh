#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# Misc system utilities
sudo apt-get update -y
sudo apt-get install -y jq pv unzip tree

# Install WSL Utilities - Azure CLIs can open browser windows for login
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update
sudo apt install wslu
