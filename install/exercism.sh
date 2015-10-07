#!/bin/sh -e

github=https://raw.githubusercontent.com

curl -sS $github/exercism/cli-www/master/public/install \
    | sudo sh -

# -----BEGIN PGP MESSAGE-----
# Version: GnuPG v1

# jA0EAwMCXyW/eRFsrplgyUdFwawvPkFwRA6qOacARrc5qYLZ1U7o4p8kI2VCDSrr
# rgI9/QN3CRulb28imyqXEslBofBzLxVNvgl7AB8RAIDxlOz/SLyo9w==
# =N/Da
# -----END PGP MESSAGE-----

exercism configure --key="${EXERCISM_API_KEY:?Need to set EXERCISM_API_KEY}"
