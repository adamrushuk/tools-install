#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# Template file, this installs 'foo'

# show available versions:
# apt-cache madison TOOL_NAME | head -n 30
# apt list update && apt list -a TOOL_NAME | head -n 30

start 'foo'
sudo apt update

end 'foo' '--version'
