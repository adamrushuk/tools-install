#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

echo "Existing Helm Plugins:"
helm plugin list
echo

# https://github.com/databus23/helm-diff/releases
helm plugin uninstall diff 2>/dev/null
helm plugin install https://github.com/databus23/helm-diff --version v3.5.0

# https://github.com/helm/helm-mapkubeapis/releases
helm plugin uninstall mapkubeapis 2>/dev/null
helm plugin install https://github.com/helm/helm-mapkubeapis --version v0.3.0

echo -e "\nHelm Plugins:"
helm plugin list
