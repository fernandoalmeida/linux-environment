#!/bin/bash

# Thanks to Rene by the Debian packaging:
# https://hadler.me/linux/forticlient-sslvpn-deb-packages/

deb=forticlient-sslvpn_4.4.2317-1_amd64.deb
wget -q https://hadler.me/files/$deb -P /tmp/
sudo dpkg -i /tmp/$deb
sudo apt-get -f install # dependencies
sudo ln -sf /opt/forticlient-sslvpn/forticlientsslvpn.sh \
            /usr/local/bin/forticlientsslvpn
