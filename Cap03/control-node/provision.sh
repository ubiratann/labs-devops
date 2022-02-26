#!/bin/sh

#instalando versao atualizada do ansible
sudo apt update -y && sudo apt upgrade -y
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install ansible -y

#garantindo permissão para importar roles do ansible-galaxy
sudo chmod +w+r+x -R /etc/ansible 

#editando arquivo de hosts
cat << EOT >> /etc/hosts
192.167.1.2 control-node
192.167.1.3 app01
192.167.1.4 db01
EOT