#!/bin/bash

# Thanks to Rene by the Debian packaging:
# https://hadler.me/linux/forticlient-sslvpn-deb-packages/

: '
-----BEGIN PGP MESSAGE-----
Version: GnuPG v1

jA0EAwMCBRaR6bnKKwFgyUUcZ9zrE34gCOjufgOi4lHPQlPeQroU9wn355iAxQzv
ZqnQs+JT2sX1DZuEgEDJCPW8H0aaVmnMBmidqhxMMzm2hS2HUT8=
=zC9t
-----END PGP MESSAGE-----
'

deb=forticlient-sslvpn_4.4.2317-1_amd64.deb

pushd $(mktemp -d)
  wget -q https://hadler.me/files/$deb
  sudo dpkg -i $deb
  sudo apt-get -f install # dependencies
popd

sudo ln -sf /opt/forticlient-sslvpn/forticlientsslvpn.sh \
            /usr/local/bin/forticlientsslvpn
