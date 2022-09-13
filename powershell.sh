#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://docs.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.2#installation-via-package-repository
# apt-cache madison powershell | head -n 40
# apt list -a powershell

start "PowerShell (ubuntu-2204)"

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository GPG keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell

# Cleanup
rm packages-microsoft-prod.deb

# Install modules
pwsh --command "Install-Module -Name posh-git, PSReadLine -Verbose"
pwsh --command "Get-Module"

end 'pwsh' '--version'
