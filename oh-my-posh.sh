#!/bin/bash

# oh-my-posh3 is a prompt theme engine for any shell

set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://github.com/JanDeDobbeleer/oh-my-posh3/releases
ver="v3.85.0"
start "oh-my-posh $ver"

mkdir -p  "$HOME/.local/bin"
wget -q "https://github.com/JanDeDobbeleer/oh-my-posh3/releases/download/${ver}/posh-linux-amd64" -O ~/.local/bin/oh-my-posh

end 'oh-my-posh' '-version'
