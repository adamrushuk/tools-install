#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# use the highest version used in environment
# KUBECTL_VERSION="latest"
KUBECTL_VERSION="1.33.7"

# use latest kubelogin version from:
# https://github.com/Azure/kubelogin/releases
# https://github.com/Azure/kubelogin/blob/main/CHANGELOG.md
KUBELOGIN_VERSION="0.2.14"

start 'Azure CLI'

# install
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?view=azure-cli-latest&pivots=apt#option-1-install-with-one-command
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# install kubectl, and kubelogin
# https://learn.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-install-cli
# https://github.com/Azure/kubelogin

# use default aks version
sudo az aks install-cli --client-version ${KUBECTL_VERSION} --kubelogin-version ${KUBELOGIN_VERSION}

# version info
command -v kubectl
kubectl version --client=true
command -v kubelogin
kubelogin --version

end 'az' 'version'
