#!/usr/bin/env bash

# kubeseal installation for use with sealed-secrets
# https://github.com/bitnami-labs/sealed-secrets

set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/bitnami-labs/sealed-secrets/releases
version="0.15.0"
start "kubeseal $version"

mkdir -p  "$HOME/.local/bin"

sudo curl -sSL -o "$HOME/.local/bin/kubeseal" https://github.com/bitnami-labs/sealed-secrets/releases/download/v${version}/kubeseal-linux-amd64
sudo chmod +x "$HOME/.local/bin/kubeseal"

end 'kubeseal' '--version'
