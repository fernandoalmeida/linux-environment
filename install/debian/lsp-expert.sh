#!/usr/bin/env bash

pushd $(mktemp -d)
  wget -qO expert https://github.com/elixir-lang/expert/releases/download/nightly/expert_linux_amd64
  chmod +x expert
  mv expert $HOME/.local/bin/
popd
