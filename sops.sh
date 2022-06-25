#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/mozilla/sops/releases
version="3.7.1"
start "SOPS: Secrets OPerationS $version"

mkdir -p  "$HOME/.local/bin"
sudo curl -sSL -o "$HOME/.local/bin/sops" https://github.com/mozilla/sops/releases/download/v${version}/sops-v${version}.linux
sudo chmod +x "$HOME/.local/bin/sops"

end 'sops' '--version'
