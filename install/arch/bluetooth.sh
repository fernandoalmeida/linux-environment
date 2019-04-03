#!/bin/bash -e

sudo pacman -Sy bluez bluez-utils blueberry

cat <<EOF | sudo tee /lib/udev/rules.d/61-bluetooth.rules
# Get access to /dev/rfkill for users
# See https://bugzilla.redhat.com/show_bug.cgi?id=514798
KERNEL=="rfkill", ENV{ACL_MANAGE}="1"
EOF
