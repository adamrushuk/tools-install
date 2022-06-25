#!/bin/bash
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://aquasecurity.github.io/trivy/v0.18.3/installation/
# https://github.com/aquasecurity/trivy/releases
ver="0.19.2"

start "Trivy $ver"

cd /tmp
wget https://github.com/aquasecurity/trivy/releases/download/v${ver}/trivy_${ver}_Linux-64bit.deb
sudo dpkg -i trivy_${ver}_Linux-64bit.deb

end 'trivy' '--version'

# usage
# docker pull CONTAINER_IMAGE
# trivy image CONTAINER_IMAGE
