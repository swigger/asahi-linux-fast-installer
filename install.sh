#!/bin/bash
# SPDX-License-Identifier: MIT

# modified from release, like https://github.com/AsahiLinux/asahi-installer.git/src

set -e

cd "$(dirname "$0")"

if [ "$USER" != "root" ] ; then
	echo "run with root, please" >&2
	exit 1
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export REPO_BASE=https://cdn.asahilinux.org
# Bootstrap does part of this, but install.sh can be run standalone
# so do it again for good measure.

if ! python3 --version >/dev/null 2>&1 ; then
	echo "need python3" >&2
	exit 1
fi

if ! arch -arm64 ls >/dev/null 2>/dev/null; then
    echo
    echo "Looks like this is an Intel Mac!"
    echo "Sorry, Asahi Linux only supports Apple Silicon machines."
    echo "May we interest you in https://t2linux.org/ instead?"
    exit 1
fi

if [ $(arch) != "arm64" ]; then
    echo
    echo "You're running the installer in Intel mode under Rosetta!"
    echo "Don't worry, we can fix that for you. Switching to ARM64 mode..."

    # This loses env vars in some security states, so just re-launch ourselves
    exec arch -arm64 ./install.sh
fi

exec python3 main.py "$@"
