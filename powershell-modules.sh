#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

start "PowerShell Modules"

# Install modules
pwsh --command "Set-PSRepository -Name 'PSGallery' -InstallationPolicy 'Trusted'"
pwsh --command "Install-Module -Name Az, Microsoft.Graph, Microsoft.Graph.Beta"
pwsh --command "Get-Module -Name Az, Microsoft.Graph, Microsoft.Graph.Beta -ListAvailable"

end 'pwsh' '--version'
