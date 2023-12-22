#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

sudo apt update -y
sudo apt upgrade -y

echo -e "\e[34m»»» 🚀 \e[32mInstalling \e[33m'Common Tools'\e[32m ... \e[39m"
~/tools/azure-cli.sh
~/tools/helm.sh
~/tools/kube-tools.sh
~/tools/misc.sh
~/tools/powershell.sh
~/tools/terraform.sh
~/tools/velero.sh
echo -e "\e[34m»»» 💪 \e[32mFinished Installing \e[33m'Common Tools'\e[32m. \e[39m"
