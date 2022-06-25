#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/Azure/azure-storage-azcopy/releases
ver="10"

start "AzCopy v$ver"

# install AzCopy
# https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
wget -q -O /tmp/azcopy.tar https://aka.ms/downloadazcopy-v10-linux
cd /tmp
tar -xf azcopy.tar
cd azcopy_linux_amd64_$ver.*
mkdir -p  "$HOME/.local/bin"
mv ./azcopy "$HOME/.local/bin/azcopy"
cd ..
rm azcopy.tar
rm -rf azcopy_linux_amd64_$ver.*

end 'azcopy' '--version'
