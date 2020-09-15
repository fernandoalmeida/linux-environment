#!/bin/bash -e

sudo aura -A azure-cli

echo "##################################################"
cat <<EOF
To restore configurations, use:
mv ~/.azure /tmp/
ln -sf /path/to/configurations/.azure ~/
EOF
echo "##################################################"
