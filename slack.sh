#!/usr/bin/env bash

curl -o slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.1.2-amd64.deb
sudo apt install ./slack.deb
rm slack.deb
