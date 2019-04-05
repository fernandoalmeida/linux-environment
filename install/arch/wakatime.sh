#!/bin/bash -e

sudo pip install wakatime

cp $(pwd)/install/arch/wakatime/config $HOME/.wakatime.cfg

cat <<MESSAGE
Get the API key on https://wakatime.com/settings/api-key
and replace $WAKATIME_APY_KEY on $HOME/.wakatime.cfg
MESSAGE
