#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# installs k9s https://github.com/derailed/k9s

# vars
VERSION='0.50.18'
TOOL_NAME='k9s'
DOWNLOAD_URL="https://github.com/derailed/k9s/releases/download/v${VERSION}/k9s_linux_amd64.deb"
DOWNLOAD_DIR=$(mktemp --directory)
DOWNLOAD_PATH="$DOWNLOAD_DIR/k9s.deb"

# prep
start "$TOOL_NAME"
mkdir -p "$DOWNLOAD_DIR"

# download
curl --location "$DOWNLOAD_URL" --output "$DOWNLOAD_PATH"

# install
# sudo dpkg-query -l | grep k9s
# sudo dpkg --remove k9s
sudo dpkg --install "$DOWNLOAD_PATH"

# cleanup
rm -fr "$DOWNLOAD_DIR"

# info
end "$TOOL_NAME" 'version'
