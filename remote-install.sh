#!/usr/bin/env bash

# Install remotely from single shell command
# Usage : curl https://raw.githubusercontent.com/wesrice/dotfiles/main/remote-install.sh | bash

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
asdf plugin remove chezmoi
asdf plugin add chezmoi https://github.com/joke/asdf-chezmoi.git
asdf install chezmoi 2.23.0
asdf shell chezmoi 2.23.0

asdf plugin remove starship
asdf plugin add starship
asdf install starship 1.10.3

chezmoi init --apply wesrice
