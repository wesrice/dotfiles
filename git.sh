#!/usr/bin/env bash

if [[ -z "$EMAIL" ]]; then
  echo "EMAIL environment variable must be set." 1>&2
  exit 1
fi

sudo apt-get install -y git

git config --global user.email $EMAIL
git config --global user.name "Wes Rice"
