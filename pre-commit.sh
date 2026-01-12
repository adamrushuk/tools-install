#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# https://pypi.org/project/pre-commit/#history
VERSION='4.5.1'

start "pre-commit $VERSION"
# Default venv: allow override with PRE_COMMIT_VENV env var
VENV_DIR="${PRE_COMMIT_VENV:-$DIR/.venv}"
if [ ! -d "$VENV_DIR" ]; then
	echo "Creating virtualenv at $VENV_DIR"
	python3 -m venv "$VENV_DIR"
fi
# activate venv
# shellcheck disable=SC1090
source "$VENV_DIR/bin/activate"

# upgrade pip inside venv and install pre-commit there
python -m pip install --upgrade pip
pip --version
pip install --no-input pre-commit==${VERSION}

end 'pre-commit' '--version'
