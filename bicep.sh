#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/Azure/bicep/releases/
VERSION="v0.24.24"

start "bicep $VERSION"

# install bicep
mkdir -p  "$HOME/.local/bin"
wget -Lq --show-progress https://github.com/Azure/bicep/releases/download/$VERSION/bicep-linux-x64 -O "$HOME/.local/bin/bicep"
chmod +x "$HOME/.local/bin/bicep"

end 'bicep' '--version'
