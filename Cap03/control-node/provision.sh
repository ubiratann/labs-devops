#!/bin/sh

sudo apt install ansible -y
sudo chmod +w+r+x -R /etc/ansible #garantindo permissão para importar roles do ansible-galaxy
cat << EOT >> /etc/hosts
192.167.1.2 control-node
192.167.1.3 app01
192.167.1.4 db01
EOT