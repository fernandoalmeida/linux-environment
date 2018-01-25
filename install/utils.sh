#!/bin/sh -e

packages="
  wget
  curl
  lsb-release
  adduser
  ca-certificates
  apt-utils
  apt-file
  htop
  locate
  tree
  software-properties-common
  aptitude
  strace
  grdesktop
  sysstat
  silversearch-ag
  mtr
  ncdu
  iftop
  nethogs
  ipcalc
  atop
"

sudo apt-get install -qqy $packages
