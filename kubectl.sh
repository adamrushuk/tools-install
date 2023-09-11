#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# show available versions (only available after adding k8s apt repo):
# apt-cache madison kubectl | head -n 30
# apt list update && apt list -a kubectl | head -n 30
VERSION="1.23.13-00"
VERSION="1.26.0-00"

start "kubectl $VERSION"

# install
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl=$VERSION
# sudo apt-get remove -y kubectl

end 'kubectl' 'version --short --client=true'
