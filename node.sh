#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
source $HOME/.zshrc
nvm install --lts
npm install -g yarn
