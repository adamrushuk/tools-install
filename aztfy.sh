#!/usr/bin/env bash
#
# Installs Azure Terrafy

set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/Azure/aztfy/releases
ver="0.5.0"

start "Terrafy $ver"

cd /tmp
curl -fL "https://github.com/Azure/aztfy/releases/download/v${ver}/aztfy_v${ver}_linux_amd64.zip" -o aztfy.zip

unzip aztfy.zip
mkdir -p  "$HOME/.local/bin"
mv aztfy "$HOME/.local/bin"
rm aztfy.zip

end 'aztfy' '--version'
