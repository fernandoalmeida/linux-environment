#!/bin/sh -e

: ${POSTGRESQL_VERSION:='9.4'}

packages="
  postgresql-$POSTGRESQL_VERSION
  postgresql-client-$POSTGRESQL_VERSION
  postgresql-contrib-$POSTGRESQL_VERSION
  postgresql-server-dev-$POSTGRESQL_VERSION
"

sudo apt-get install -qqy $packages

cat <<EOF | sudo tee /etc/postgresql/$POSTGRESQL_VERSION/main/pg_hba.conf
local  all  all                trust
host   all  all  127.0.0.1/32  trust
host   all  all  ::1/128       trust
EOF

sudo systemctl restart postgresql.service
