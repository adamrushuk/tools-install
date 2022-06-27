#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/terraform-docs/terraform-docs#readme
VERSION="v0.16.0"

start "terraform-docs $VERSION"

# install
curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/$VERSION/terraform-docs-$VERSION-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mkdir -p  "$HOME/.local/bin"
mv terraform-docs "$HOME/.local/bin"
rm terraform-docs.tar.gz

end 'terraform-docs' '--version'

