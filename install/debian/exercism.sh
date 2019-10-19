#!/bin/bash -e

github=https://raw.githubusercontent.com

curl -sS $github/exercism/cli-www/master/public/install \
    | sudo sh -

cat <<EOF | tee ~/.bashrc.d/exercismrc
-----BEGIN PGP MESSAGE-----
Version: GnuPG v1

jA0EAwMCHkAz3tLGMmpgyUcVGFk1zqFYqj8g+HR+my3Ma8ah3/9p1yoxixsMq5RR
yfo6P06z1IEqesNFUy0LOu4rNn5drt9qDaVrCrsZVhf/8BGp+Pmn7w==
=CV3/
-----END PGP MESSAGE-----

grep \$EXERCISM_API_KEY ~/.exercism.json > /dev/null \\
    || exercism configure --key="\${EXERCISM_API_KEY:?Unknown EXERCISM_API_KEY}"
EOF

echo -e "\033[32m\n" \
     "\n############################################################" \
     "\n~/.bashrc.d/exercismrc <~~~~~ EDIT IT" \
     "\n############################################################\033[0m"
