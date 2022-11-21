#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# installs exercism https://exercism.org/cli-walkthrough

# vars
TOOL_NAME='exercism'
DOWNLOAD_URL='https://github.com/exercism/cli/releases/download/v3.1.0/exercism-3.1.0-linux-x86_64.tar.gz'
DOWNLOAD_FILE="$TOOL_NAME.tar.gz"
DOWNLOAD_DIR="/tmp/$TOOL_NAME"
INSTALL_PATH="$HOME/.local/bin"

# prep
start "$TOOL_NAME"
mkdir -p "$DOWNLOAD_DIR"

# download
curl --location "$DOWNLOAD_URL" --output $DOWNLOAD_DIR/$DOWNLOAD_FILE

# extract
cd $DOWNLOAD_DIR
tar -zxf $DOWNLOAD_FILE
ls -lah

# install
# copy files and create the directories at the destination if they don't exist
# install -D path/to/source_file1 path/to/destination/folder
install -D "$DOWNLOAD_DIR/$TOOL_NAME" "$INSTALL_PATH"

# cleanup
rm -fr "$DOWNLOAD_DIR"

# info
end 'exercism' 'version'
