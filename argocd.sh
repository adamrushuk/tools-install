#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/argoproj/argo-cd/releases
version="2.9.4"

start "Argo CD $version"

# install
mkdir -p  "$HOME/.local/bin"
sudo curl -L -o "$HOME/.local/bin/argocd" https://github.com/argoproj/argo-cd/releases/download/v${version}/argocd-linux-amd64
sudo chmod +x "$HOME/.local/bin/argocd"

end 'argocd' 'version --client'
