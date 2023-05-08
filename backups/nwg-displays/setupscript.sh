#! /bin/sh
currentdir=$( dirname -- "$( readlink -f -- "$0"; )"; )

pythoninstallscript="$currentdir/nwg-displays-repo/install.sh"
if [ ! -x "$pythoninstallscript" ]; then
    chmod +x "$pythoninstallscript"
fi
"$pythoninstallscript"

