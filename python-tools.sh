#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://pypi.org/project/tldr/#history
TLDR_VERSION='3.4.3'
# PACKAGE_VERSION='x.x.x'

# Default venv: allow override with PYTHON_TOOLS_VENV env var
VENV_DIR="${PYTHON_TOOLS_VENV:-$DIR/.venv}"
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtualenv at $VENV_DIR"
    python3 -m venv "$VENV_DIR"
fi
# shellcheck disable=SC1090
source "$VENV_DIR/bin/activate"

python -m pip install --upgrade pip
pip --version

pip install --no-input \
        tldr==${TLDR_VERSION}
