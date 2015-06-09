#!/bin/sh -e

: ${LUA_VERSION:="5.2"}
: ${LUA_ROCKS_VERSION:="2.2.1"}
: ${TMP:="$(pwd)/tmp"}

#
## Lua
#
sudo apt-get install lua$LUA_VERSION liblua$LUA_VERSION-dev

#
## Lua Rocks
#
wget http://luarocks.org/releases/luarocks-$LUA_ROCKS_VERSION.tar.gz -nc -P $TMP
tar -C $TMP -zxpf $TMP/luarocks-$LUA_ROCKS_VERSION.tar.gz
cd $TMP/luarocks-$LUA_ROCKS_VERSION && ./configure && sudo make bootstrap
