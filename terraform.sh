#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/hashicorp/terraform/releases
ver="1.2.3"

start "Terraform $ver"

# install
cd /tmp
curl -fsS "https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip" -o tf.zip
unzip tf.zip
mkdir -p  "$HOME/.local/bin"
mv terraform "$HOME/.local/bin"
rm tf.zip

end 'terraform' '--version'
