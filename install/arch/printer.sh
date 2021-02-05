#!/bin/bash -e

sudo pacman -Sy cups system-config-printer
sudo aura -A hplip-plugin
