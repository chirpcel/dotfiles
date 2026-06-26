#!/usr/bin/env bash
set -euo pipefail

user="$1"
dotPath="$2"
targetHome="$3"
shift 3
packages=("$@")

if [ ! -d "${dotPath}" ]; then
  echo "Error: dotPath '${dotPath}' does not exist for user ${user}" >&2
  exit 1
fi

echo "Applying stow for user ${user}, packages: ${packages[*]}"
stow --adopt --dir="${dotPath}" --target="${targetHome}" --stow "${packages[@]}"

echo "Stow completed successfully for ${user}"
