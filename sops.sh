#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/mozilla/sops/releases
version="3.7.3"

start "SOPS: Secrets OPerationS $version"

# install
mkdir -p  "$HOME/.local/bin"
sudo curl -sSL -o "$HOME/.local/bin/sops" https://github.com/mozilla/sops/releases/download/v${version}/sops-v${version}.linux
sudo chmod +x "$HOME/.local/bin/sops"

end 'sops' '--version'
