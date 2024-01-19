#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/aquasecurity/tfsec/releases
VERSION="v1.28.5"

start "tfsec $VERSION"

# install
mkdir -p  "$HOME/.local/bin"
wget -Lq --show-progress "https://github.com/aquasecurity/tfsec/releases/download/$VERSION/tfsec-linux-amd64" -O "$HOME/.local/bin/tfsec"
chmod +x "$HOME/.local/bin/tfsec"

end 'tfsec' '--version'
