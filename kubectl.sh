#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# show available versions (only available after adding k8s apt repo):
# apt-cache madison kubectl | head -n 30
VERSION="1.33.7-ubuntu24.04u1"
MINOR_VERSION="v1.33"

start "kubectl $VERSION"

# install
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

# Update the apt package index and install packages needed to use the Kubernetes apt repository:
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# If the folder `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/${MINOR_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

sudo apt-get update
sudo apt-get install -y kubectl=$VERSION
# sudo apt-get remove -y kubectl

end 'kubectl' 'version --client=true'
