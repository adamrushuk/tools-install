#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# show available versions:
# apt-cache madison git | head -n 40
# https://github.com/git/git/tags
GIT_VERSION="1:2.34.1-1ubuntu1.2"
# https://github.com/GitCredentialManager/git-credential-manager/releases
GCM_VERSION="2.0.696"

start "Git $GIT_VERSION"
start "Git Credential Manager $GCM_VERSION"

# https://git-scm.com/download/linux
echo "Adding PPA for latest stable git version:"
sudo add-apt-repository ppa:git-core/ppa --yes
sudo apt-get install git=$GIT_VERSION

# https://github.com/GitCredentialManager/git-credential-manager#ubuntudebian-distributions
# download binary
GCM_DOWNLOAD_PATH="/tmp/gcmcore-linux_amd64.deb"
curl -L -o $GCM_DOWNLOAD_PATH https://github.com/GitCredentialManager/git-credential-manager/releases/download/v${GCM_VERSION}/gcmcore-linux_amd64.${GCM_VERSION}.deb

# install
sudo dpkg -i $GCM_DOWNLOAD_PATH

# configure gcm core
git-credential-manager-core configure
git config --global credential.credentialStore secretservice

# cleanup
rm -f $GCM_DOWNLOAD_PATH

# info
echo "Git exec path and version info:"
git --exec-path
git --version
git-credential-manager-core --version
