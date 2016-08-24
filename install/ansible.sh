#!/bin/bash -e

if [ ! -d /opt/ansible ]; then
  sudo git clone --recursive \
    git://github.com/ansible/ansible.git \
    /opt/ansible
fi

sudo chmod +x /opt/ansible/hacking/env-setup
/opt/ansible/hacking/env-setup

sudo pip install paramiko PyYAML Jinja2 httplib2 six

mkdir -p ~/.ansible
echo "127.0.0.1" > ~/.ansible/hosts

ln -sfn $(pwd)/install/ansible/ansiblerc $HOME/.bashrc.d/ansiblerc
source $(pwd)/install/ansible/ansiblerc

sudo apt-get install -qq sshpass

echo -e "\033[32m\n" \
     "\n############################################################" \
     "\nTEST COMMAND: ansible all -m ping --ask-pass" \
     "\n############################################################\033[0m"
