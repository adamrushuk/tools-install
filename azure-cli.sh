#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

start 'Azure CLI'

# install
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

end 'az' 'version'
