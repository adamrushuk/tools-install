#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/hashicorp/terraform/releases
VERSION="1.12.1"

start "Terraform $VERSION"

# install
cd /tmp
curl -fS "https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip" -o tf.zip
unzip tf.zip
mkdir -p  "$HOME/.local/bin"
mv terraform "$HOME/.local/bin"
rm tf.zip

end 'terraform' '--version'
