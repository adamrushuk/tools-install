#!/usr/bin/env bash
set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

# install system packages (skip by setting SKIP_APT=1)
python3 --version
if [ "${SKIP_APT:-0}" -ne 1 ]; then
	sudo apt update
	sudo apt install -y python3-pip python3-venv
else
	echo "SKIP_APT=1 set; skipping apt install"
fi

# Instead of upgrading the OS-managed pip (PEP 668 prevents this),
# create and use a virtual environment and upgrade pip inside it.
VENVDIR="$DIR/.venv"
python3 -m venv "$VENVDIR"
# shellcheck disable=SC1090
source "$VENVDIR/bin/activate"
python -m pip install --upgrade pip
pip --version
