#!/usr/bin/env zsh

set -euo pipefail

# Gets a list of files
function getFilesInDir() {
  find "$1" ! -path ./.DS_Store -name '*.*'
}

# $1 directory to search for files
# $2 destination of symlink
function symlinkFilesTo() {
  for F in $(getFilesInDir "$1"); do
    # Make symlink
    cleanPath=$(echo "$F" | sed 's,^[^/]*/,,')
    echo "- ${2}/${cleanPath} -> ${1}/${cleanPath}"
    mkdir -p "$(dirname "${2}/${cleanPath}")"
    ln -sfn "${PWD}/${1}/${cleanPath}" "${2}/${cleanPath}"
  done
}

# Home files
echo "==> Setting Home symlink..."
symlinkFilesTo home "${HOME}"

# Unset
unset getFilesInDir
unset symlinkFilesTo

echo "==> Done!"
