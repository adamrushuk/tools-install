#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# show available versions (only available after adding k8s apt repo):
# apt-cache madison kubectl | head -n 30
VERSION="1.27.8-1.1"
MINOR_VERSION="v1.27"

start "kubectl $VERSION"

# install
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

# Update the apt package index and install packages needed to use the Kubernetes apt repository:
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# Download the public signing key for the Kubernetes package repositories.
# The same signing key is used for all repositories so you can disregard the version in the URL
curl -fsSL https://pkgs.k8s.io/core:/stable:/${MINOR_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${MINOR_VERSION}/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubectl=$VERSION
# sudo apt-get remove -y kubectl

end 'kubectl' 'version --short --client=true'
