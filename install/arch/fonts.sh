#!/bin/bash -e

pacman -Slq | grep -e "-fonts$" | xargs sudo pacman -S --noconfirm

sudo aura -A nerd-fonts-hack
