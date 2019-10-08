#!/bin/bash -e

sudo aura -A exercism-bin

echo -e "\033[32m\n" \
     "\n############################################################" \
     "\nget your APIKEY on https://exercism.io/my/settings and run:" \
     "\n" \
     "\ncd coding-challenges/exercism.io" \
     "\nexercism configure -t APIKEY -w \$(pwd)" \
     "\n############################################################\033[0m"
