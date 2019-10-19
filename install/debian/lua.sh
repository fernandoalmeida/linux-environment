#!/bin/sh -e

: ${LUA_VERSION:="5.2"}

sudo apt-get install -qqy lua$LUA_VERSION liblua$LUA_VERSION-dev luarocks
sudo luarocks install busted
