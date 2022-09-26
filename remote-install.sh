#!/usr/bin/env bash

# Install remotely from single shell command
# Usage : sh -c "$(curl -fsSL https://raw.githubusercontent.com/wesrice/dotfiles/remote-install.sh)"

set -e

# Install core dependencies
if [ "$(uname -s)" == "Darwin" ]; then
  # xcode-select --install
  echo "mac os"
else
  sudo apt install curl git -y
fi

# Install asdf
if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
fi

. $HOME/.asdf/asdf.sh
asdf plugin add chezmoi https://github.com/joke/asdf-chezmoi.git
asdf install chezmoi latest

asdf plugin add starship
asdf install starship latest

chezmoi init --apply wesrice
