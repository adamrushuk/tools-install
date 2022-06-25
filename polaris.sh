#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/fairwindsops/polaris/releases
ver="6.0.0"

start "Polaris $ver"

# install
curl -sL "https://github.com/FairwindsOps/polaris/releases/download/4.2.0/polaris_linux_amd64.tar.gz" -o /tmp/polaris.tar.gz
cd /tmp
mkdir -p  "$HOME/.local/bin"
tar -zxf polaris.tar.gz
sudo mv polaris "$HOME/.local/bin"
rm polaris.tar.gz

end 'polaris' 'version'
