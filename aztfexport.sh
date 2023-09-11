#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/Azure/aztfexport/releases
ver="0.13.1"

start "Microsoft Azure Export for Terraform (aztfexport) $ver"

# install Azure Terrafy
cd /tmp
curl -fL "https://github.com/Azure/aztfexport/releases/download/v${ver}/aztfexport_v${ver}_linux_amd64.zip" -o aztfexport.zip
unzip aztfexport.zip
mkdir -p  "$HOME/.local/bin"
mv aztfexport "$HOME/.local/bin"
rm aztfexport.zip

end 'aztfexport' '--version'
