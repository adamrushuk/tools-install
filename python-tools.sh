#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# PACKAGE_VERSION='x.x.x'

# https://pypi.org/project/tldr/#history
TLDR_VERSION='3.4.3'

# https://pypi.org/project/pre-commit/#history
PRECOMMIT_VERSION='4.5.1'

python3 -m pip install --break-system-packages --upgrade pip

pip3 install --break-system-packages --no-input tldr==${TLDR_VERSION} pre-commit==${PRECOMMIT_VERSION}
