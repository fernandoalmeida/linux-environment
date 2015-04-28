#!/bin/sh -e

echo "deb http://www.rabbitmq.com/debian/ testing main" | sudo tee /etc/apt/sources.list.d/rabbitmq.list
curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc -o /tmp/rabbitmq-signing-key-public.asc
sudo apt-key add /tmp/rabbitmq-signing-key-public.asc
rm /tmp/rabbitmq-signing-key-public.asc

sudo apt-get update -qq
sudo apt-get install  -qq --yes --force-yes rabbitmq-server
sudo service rabbitmq-server start

sudo rabbitmq-plugins enable rabbitmq_management
sudo wget http://localhost:15672/cli/rabbitmqadmin -P /usr/local/bin/
sudo chmod +x /usr/local/bin/rabbitmqadmin
sudo sh -c "rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin"
