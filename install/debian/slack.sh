#!/bin/bash -e

# latest version link here
# https://slack.com/downloads/instructions/linux?ddl=1&build=deb

pushd $(mktemp -d)
  wget -qO slack.deb https://downloads.slack-edge.com/desktop-releases/linux/x64/4.43.51/slack-desktop-4.43.51-amd64.deb
  sudo dpkg -i slack.deb
popd
