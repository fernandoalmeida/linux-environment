#!/bin/bash -e

version=community-2.1.6
file=orientdb-$version.tar.gz
path=/opt/orientdb
dbuser=root

pushd $(mktemp -d)
  # download
  if [ -z $path ]; then
    wget -q -O $file "http://orientdb.com/download.php?file=$file&os=linux"
    sudo tar -C /opt -zxf $file
    sudo mv /opt/orientdb{-$version,}
  fi

  # console
  sudo ln -sf $path/bin/console.sh /usr/bin/orientdb

  # service
  sudo sed -i "s:YOUR_ORIENTDB_INSTALLATION_PATH:$path:" \
       $path/bin/orientdb.sh
  sudo sed -i "s:USER_YOU_WANT_ORIENTDB_RUN_WITH:$dbuser:" \
       $path/bin/orientdb.sh
  sudo ln -sf $path/bin/orientdb.sh /etc/init.d/orientdb
  sudo /etc/init.d/orientdb start
popd
