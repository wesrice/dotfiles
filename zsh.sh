#!/usr/bin/env bash

# Clean
rm -rf $HOME/.oh-my-zsh $HOME/.zshrc $ZSH_CUSTOM/themes/spaceship-prompt

# Install ZSH
sudo apt-get install -y zsh
sudo chsh -s /usr/bin/zsh $USER

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

# Symlink settings
ln -sfn $PWD/zsh/.zshrc $HOME/.zshrc
