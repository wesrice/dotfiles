#!/usr/bin/env bash

set -e # -e: exit on error

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://chezmoi.io/get)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

export DEBIAN_FRONTEND=noninteractive

echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
echo "asdf installed!"

"$chezmoi" init wesrice
# "$chezmoi" apply "$HOME/.bashrc"
# source ~/.bashrc

"$chezmoi" apply

$("$chezmoi" source-path)/install-vscode-extensions.sh
