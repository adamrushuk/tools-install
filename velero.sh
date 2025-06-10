#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/vmware-tanzu/velero/releases
ver="v1.16.1"

start "Velero $ver"

# install
curl -L "https://github.com/vmware-tanzu/velero/releases/download/${ver}/velero-${ver}-linux-amd64.tar.gz" -o /tmp/velero.tar.gz
cd /tmp
mkdir -p  "$HOME/.local/bin"
tar -zxf velero.tar.gz
sudo mv velero-${ver}-linux-amd64/velero "$HOME/.local/bin"
rm -rf velero-${ver}-linux-amd64
rm velero.tar.gz

end 'velero' 'version --client-only'
