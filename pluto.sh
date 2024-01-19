#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/FairwindsOps/pluto/releases
ver="5.19.0"

start "Pluto $ver"

# install
curl -sL "https://github.com/FairwindsOps/pluto/releases/download/v${ver}/pluto_${ver}_linux_amd64.tar.gz" -o /tmp/pluto.tar.gz
cd /tmp
mkdir -p  "$HOME/.local/bin"
tar -zxf pluto.tar.gz
sudo mv pluto "$HOME/.local/bin"
rm pluto.tar.gz

end 'pluto' 'version'
