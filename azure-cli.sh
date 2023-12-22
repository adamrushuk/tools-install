#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

start 'Azure CLI'

# install
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=apt#option-1-install-with-one-command
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# install kubectl, and kubelogin
# https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-install-cli
# https://github.com/Azure/kubelogin

# use default aks version
sudo az aks install-cli

# version info
command -v kubectl
kubectl version --client=true
command -v kubelogin
kubelogin --version

end 'az' 'version'
