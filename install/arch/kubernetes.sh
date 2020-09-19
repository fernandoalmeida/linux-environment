#!/bin/bash -e

sudo pacman -Sy kubectl minikube
sudo aura -A kops

echo "##################################################"
cat <<EOF
To restore configurations, use:
ln -sf /path/to/configurations/.kube ~/
EOF
echo "##################################################"
