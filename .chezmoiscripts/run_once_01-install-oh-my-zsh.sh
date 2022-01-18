#!/usr/bin/env bash

echo "Installing oh-my-zsh..."
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
echo "oh-my-zsh-installed"
