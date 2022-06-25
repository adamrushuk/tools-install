#!/bin/bash
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/hashicorp/terraform/releases
ver="1.2.2"

start "Terraform $ver"

cd /tmp
curl -fsS "https://releases.hashicorp.com/terraform/${ver}/terraform_${ver}_linux_amd64.zip" -o tf.zip

unzip tf.zip
mkdir -p  "$HOME/.local/bin"
mv terraform "$HOME/.local/bin"
rm tf.zip

end 'terraform' '--version'
