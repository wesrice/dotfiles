#!/usr/bin/env bash

# Install Hyper
curl -L -o hyper.deb https://releases.hyper.is/download/deb
sudo apt install -y ./hyper.deb
rm hyper.deb

# Symlink settings
ln -sfn $PWD/hyper/.hyper.js $HOME/.config/hyper/.hyper.js
