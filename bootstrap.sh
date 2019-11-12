#!/usr/bin/env bash

if [[ -z "$EMAIL" ]]; then
  echo "EMAIL environment variable must be set." 1>&2
  exit 1
fi

sudo apt-get update -y
sudo apt-get dist-upgrade -y

./ssh
./git

repos=$HOME/repos
mkdir -p $repos

dir="$repos/dotfiles"
if [ ! -d "$dir" ]; then
	git clone https://github.com/wesrice/dotfiles.git "$repos/dotfiles"
fi

cd dir

git remote remove origin
git remote add origin git@github.com:wesrice/dotfiles.git
git push --set-upstream origin master

./install.sh
