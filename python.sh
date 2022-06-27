#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# install pip
python3 --version
sudo apt update
sudo apt install -y python3-pip

# upgrade pip
python3 -m pip install --upgrade pip
pip --version
