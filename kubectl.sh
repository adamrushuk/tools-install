#!/bin/bash
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# show available versions:
# apt-cache madison kubectl | head -n 40
VERSION="1.20.9-00"

start "kubectl $VERSION"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl=$VERSION
# sudo apt-get remove -y kubectl

echo -e "\nInstalled to: $(which kubectl)"
echo -e "\nVersion details: \n$(kubectl version)"

end 'kubectl' 'version'
