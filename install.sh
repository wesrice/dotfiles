#!/bin/bash

# Install remotely from single shell command
# Usage : curl https://raw.githubusercontent.com/wesrice/dotfiles/main/install.sh | bash

set -e

# Install core dependencies
if [ "$(uname -s)" == "Darwin" ]; then
  # xcode-select --install
  echo "mac os"
else
  sudo apt install curl git -y
fi

# Install asdf
rm -rf $HOME/.asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

. $HOME/.asdf/asdf.sh

if [ -d "$HOME/.local/share/chezmoi" ]; then
  rm -rf $HOME/.local/share/chezmoi
fi

asdf plugin add chezmoi https://github.com/joke/asdf-chezmoi.git
asdf install chezmoi 2.23.0
asdf shell chezmoi 2.23.0

asdf plugin add starship
asdf install starship 1.10.3

chezmoi init --apply wesrice
