#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

sudo apt update -y
sudo apt upgrade -y

sh ./azcopy.sh
sh ./azure-cli.sh
sh ./docker-client.sh
sh ./docker-engine.sh
sh ./dotnet.sh
sh ./functions.sh
sh ./golang.sh
sh ./helm.sh
sh ./jekyll.sh
sh ./kubectl.sh
sh ./kubens.sh
sh ./misc.sh
sh ./node.sh
sh ./powershell.sh
sh ./terraform.sh
sh ./zsh.sh
