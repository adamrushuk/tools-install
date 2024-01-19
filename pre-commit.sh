#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://pypi.org/project/pre-commit/#history
VERSION='3.6.0'

start "pre-commit $VERSION"

# https://pre-commit.com/#install
pip install --no-input pre-commit==${VERSION}

end 'pre-commit' '--version'
