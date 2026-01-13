#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

sudo apt update -y && sudo apt upgrade -y

echo -e "\e[34m»»» 🚀 \e[32mInstalling \e[33m'Common Tools'\e[32m ... \e[39m"
~/tools/azure-cli.sh
~/tools/helm.sh
~/tools/powershell.sh
~/tools/powershell-modules.sh

~/tools/terraform-docs.sh
~/tools/terraform.sh
~/tools/velero.sh

# TO FIX
~/tools/kubectl.sh
~/tools/kube-tools.sh # waiting to get kubectl working first
~/tools/misc.sh # are WSL Utilities still required so Azure CLIs can open browser windows for login?

~/tools/python.sh
~/tools/pre-commit.sh
~/tools/python-tools.sh
echo -e "\e[34m»»» 💪 \e[32mFinished Installing \e[33m'Common Tools'\e[32m. \e[39m"
