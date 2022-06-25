#!/bin/bash
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/aquasecurity/tfsec/releases
VERSION="v1.21.2"
start "tfsec $VERSION"

mkdir -p  "$HOME/.local/bin"

wget -Lq --show-progress "https://github.com/aquasecurity/tfsec/releases/download/$VERSION/tfsec-linux-amd64" -O "$HOME/.local/bin/tfsec"
chmod +x "$HOME/.local/bin/tfsec"

end 'tfsec' '--version'
