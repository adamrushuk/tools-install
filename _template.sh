#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

#
# Template file, this installs 'foo'
#
start 'foo'
sudo apt update

end 'foo' '--version'
