#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/mozilla/sops/releases
version="3.8.1"

start "SOPS: Secrets OPerationS $version"

# install
mkdir -p  "$HOME/.local/bin"
sudo curl -sSL -o "$HOME/.local/bin/sops" https://github.com/getsops/sops/releases/download/v${version}/sops-v${version}.linux.amd64
sudo chmod +x "$HOME/.local/bin/sops"

end 'sops' '--version'
