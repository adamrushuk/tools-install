#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://aquasecurity.github.io/trivy/latest/getting-started/installation/
# https://github.com/aquasecurity/trivy/releases
ver="0.48.3"

start "Trivy $ver"

# install
cd /tmp
wget https://github.com/aquasecurity/trivy/releases/download/v${ver}/trivy_${ver}_Linux-64bit.deb
sudo dpkg -i trivy_${ver}_Linux-64bit.deb

end 'trivy' '--version'

# usage
# docker pull CONTAINER_IMAGE
# trivy image CONTAINER_IMAGE
