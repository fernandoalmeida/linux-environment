#!/bin/bash -e

sudo aura -A warsaw-bin

sudo systemctl start warsaw
sudo systemctl enable warsaw
