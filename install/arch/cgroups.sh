#!/bin/bash -e

sudo aura -Ay libcgroup
sudo rm -f /etc/cgconfig.conf
sudo rm -f /etc/cgrules.conf

sudo ln -sfn $(pwd)/install/arch/cgroups/cgconfig.conf /etc/cgconfig.conf
sudo ln -sfn $(pwd)/install/arch/cgroups/cgrules.conf /etc/cgrules.conf

sudo systemctl link $(pwd)/install/arch/cgroups/cgroupscustom.service
sudo systemctl enable cgroupscustom
sudo systemctl start cgroupscustom
