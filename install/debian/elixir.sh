#!/bin/bash -e

sudo apt-get install -qqy elixir

mix local.hex
mix archive.install \
    https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
