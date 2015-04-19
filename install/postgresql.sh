#!/bin/bash -e

: ${POSTGRESQL_VERSION:='9.4'}

packages="
  postgresql-$POSTGRESQL_VERSION
  postgresql-client-$POSTGRESQL_VERSION
  postgresql-contrib-$POSTGRESQL_VERSION
  postgresql-server-dev-$POSTGRESQL_VERSION
"

echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get install -qq --yes --force-yes $packages

cat <<EOF > /etc/postgresql/$POSTGRESQL_VERSION/main/pg_hba.conf
local  all  all                trust
host   all  all  127.0.0.1/32  trust
host   all  all  ::1/128       trust
EOF

sudo service postgresql restart
