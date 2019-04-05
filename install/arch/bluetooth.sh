#!/bin/bash -e

sudo pacman -Sy bluez bluez-utils blueberry

sudo systemctl enable bluetooth
sudo systemctl start bluetooth

cat <<EOF | sudo tee /lib/udev/rules.d/61-bluetooth.rules
# Get access to /dev/rfkill for users
# See https://bugzilla.redhat.com/show_bug.cgi?id=514798
KERNEL=="rfkill", ENV{ACL_MANAGE}="1"
EOF

cat <<MESSAGE
# use bluetoothctl for pairing
- power on
- scan on
- agent on
- devices
- trust DEVICE
- unblock DEVICE
- pair DEVICE
- connect DEVICE

# see documentation for details
https://wiki.archlinux.org/index.php/bluetooth#Pairing
MESSAGE
