#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/JanDeDobbeleer/oh-my-posh3/releases
ver="v14.22.0"

start "oh-my-posh $ver"

# install oh-my-posh3 (a prompt theme engine for any shell)
mkdir -p  "$HOME/.local/bin"
wget -q "https://github.com/JanDeDobbeleer/oh-my-posh3/releases/download/${ver}/posh-linux-amd64" -O ~/.local/bin/oh-my-posh

end 'oh-my-posh' '--version'
