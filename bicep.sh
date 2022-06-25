#!/bin/bash
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/Azure/bicep/releases/
VERSION="v0.6.18"
start "bicep $VERSION"

mkdir -p  "$HOME/.local/bin"

wget -Lq --show-progress https://github.com/Azure/bicep/releases/download/$VERSION/bicep-linux-x64 -O "$HOME/.local/bin/bicep"
chmod +x "$HOME/.local/bin/bicep"

end 'bicep' '--version'
