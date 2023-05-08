#!/bin/bash

currentdir=$( dirname -- "$( readlink -f -- "$0"; )"; ) 

# install apps from local dir
source="$currentdir"
customscriptname="setupscript.sh"
# loop over sub-directories in source
find "$source" -mindepth 1 -maxdepth 1 -type d | while read subdir; do
    echo "Installing $subdir ..."
    subdirpath="$(readlink -f $subdir)"
    scriptpath="$subdirpath/$customscriptname"
    # if setupscript exists, make executable and run
    if [ -f "$scriptpath" ]; then
        if [ ! -x "$scriptpath" ]; then
            chmod +x "$scriptpath"
        fi
        "$scriptpath"
    # if no script just copy contents to /
    else
        cp -r "$subdirpath"/* "/"
    fi
done

