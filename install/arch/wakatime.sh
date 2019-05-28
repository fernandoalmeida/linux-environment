#!/bin/bash -e

sudo pip install wakatime

cp $(pwd)/install/arch/wakatime/config $HOME/.wakatime.cfg

pushd $(mktemp -d)
sudo git clone https://github.com/gjsheep/bash-wakatime.git /opt/bash-wakatime
ln -s /opt/bash-wakatime/bash-wakatime.sh $HOME/.bashrc.d/custom/wakatime
popd

cat <<MESSAGE
Get the API key on https://wakatime.com/settings/api-key
and replace $WAKATIME_APY_KEY on $HOME/.wakatime.cfg
MESSAGE
