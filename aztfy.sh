#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/Azure/aztfy/releases
ver="0.7.0"

start "Terrafy $ver"

# install Azure Terrafy
cd /tmp
curl -fL "https://github.com/Azure/aztfy/releases/download/v${ver}/aztfy_v${ver}_linux_amd64.zip" -o aztfy.zip
unzip aztfy.zip
mkdir -p  "$HOME/.local/bin"
mv aztfy "$HOME/.local/bin"
rm aztfy.zip

end 'aztfy' '--version'
