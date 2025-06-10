#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://pypi.org/project/tldr/#history
TLDR_VERSION='3.4.1'
# PACKAGE_VERSION='x.x.x'

pip install --no-input \
    tldr==${TLDR_VERSION} \
    # package_name==${PACKAGE_VERSION} \
