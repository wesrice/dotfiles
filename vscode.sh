#!/usr/bin/env bash

# Install VSCode
# curl -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
# sudo apt install -y ./vscode.deb
# rm vscode.deb

# Install extensions
extensions=(
  eamodio.gitlens # GitLens
  editorconfig.editorconfig # EditorConfig
  ms-vscode-remote.vscode-remote-extensionpack # Remote Development
  tyriar.sort-lines # Sort Lines
  zhuangtongfa.material-theme # One Dark Pro
)


for extension in "${extensions[@]}"
do
  code --install-extension $extension
done   

# Symlink settings
mkdir -p /home/node/.config/Code/User 
ln -sfn $PWD/vscode/settings.json $HOME/.config/Code/User/settings.json
