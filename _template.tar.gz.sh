#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# installs TOOL_NAME https://URL_FOR_TOOL_INFO

# vars
TOOL_NAME=''
TOOL_BINARY_NAME=''
DOWNLOAD_URL='https://URL_FOR_TOOL_BINARY.tar.gz'
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
# copy file(s) and create directories at the destination if they don't exist
# install -D path/to/source_file1 path/to/destination/folder
install -D "$DOWNLOAD_DIR/$TOOL_BINARY_NAME" "$INSTALL_PATH"

# cleanup
rm -fr "$DOWNLOAD_DIR"

# info
end 'foo' '--version'
