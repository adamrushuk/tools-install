#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://docs.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.2#installation-via-package-repository
# apt-cache madison powershell | head -n 40
# apt list update && apt list -a powershell

start "PowerShell"

###################################
# Prerequisites

# Update the list of packages
sudo apt-get update

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common

# Get the version of Ubuntu
source /etc/os-release

# Download the Microsoft repository keys
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository keys
sudo dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
sudo apt-get update

###################################
# Install PowerShell
sudo apt-get install -y powershell

# Install modules
pwsh --command "Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Trusted' -Verbose"
pwsh --command "Install-Module -Name posh-git, PSReadLine, Microsoft.PowerShell.SecretManagement, Microsoft.PowerShell.SecretStore -Verbose"
pwsh --command "Get-Module"

end 'pwsh' '--version'
