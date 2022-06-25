#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/golang/go/tags
# ver="1.15.2"
# start "Go $ver"

# cd /tmp
# curl -fsS https://dl.google.com/go/go${ver}.linux-amd64.tar.gz -o golang.tar.gz

# sudo tar -xvf golang.tar.gz
# sudo rm -rf /usr/local/go
# sudo mv go /usr/local

sudo apt update
sudo apt install -y golang-go

end 'go' 'version'
