#!/bin/bash -e

file="toggl.deb"
repo="https://toggl.com/api/v8/installer?app=td&platform=deb64&channel=stable"

pushd $(mktemp -d)
  curl -sLo $file $repo
  sudo dpkg -i $file

  sudo ln -s /opt/toggldesktop/TogglDesktop.sh /usr/bin/toggl
popd
