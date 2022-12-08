#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# installs GitLab CLI https://gitlab.com/gitlab-org/cli

# vars
VERSION='1.24.1'
TOOL_NAME='GitLab CLI'
DOWNLOAD_URL="https://gitlab.com/gitlab-org/cli/-/releases/v${VERSION}/downloads/glab_${VERSION}_Linux_x86_64.deb"
DOWNLOAD_DIR=$(mktemp --directory)
DOWNLOAD_PATH="$DOWNLOAD_DIR/glab.deb"

# prep
start "$TOOL_NAME"
mkdir -p "$DOWNLOAD_DIR"

# download
curl --location "$DOWNLOAD_URL" --output "$DOWNLOAD_PATH"

# install
sudo dpkg --install "$DOWNLOAD_PATH"

# cleanup
rm -fr "$DOWNLOAD_DIR"

# info
end 'glab' '--version'
echo 'Use the commands below log in to your GitLab instance:'
echo 'glab auth login -h'
echo 'glab auth login --hostname "gitlab.company.com" --token "MY_ACCESS_TOKEN"'
