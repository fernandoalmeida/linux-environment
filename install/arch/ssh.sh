#!/bin/bash -e

sudo pacman -Sy openssh

echo "##################################################"
cat <<EOF
To restore configurations, use:
ln -sf /path/to/configurations/.ssh ~/
EOF
echo "##################################################"
