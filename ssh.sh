#!/usr/bin/env bash

if [[ -z "$EMAIL" ]]; then
  echo "EMAIL environment variable must be set." 1>&2
  exit 1
fi

# Install SSH
sudo apt-get install -y ssh

# Create SSH key if one doesn't exist
file="$HOME/.ssh/id_rsa.pub"
if [ ! -f "$file" ]; then
	ssh-keygen -t rsa -b 4096 -C $EMAIL
fi

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
