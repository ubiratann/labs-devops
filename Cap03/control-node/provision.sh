#!/bin/sh

#instalando versao atualizada do ansible
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install ansible -y

#garantindo permissão para importar roles do ansible-galaxy
sudo chmod +w+r+x -R /etc/ansible 

echo "Adicionando hosts"
#editando arquivo de hosts
cat << EOT >> /etc/hosts
192.167.1.2 control-node
192.167.1.3 app01
192.167.1.4 db01
EOT

echo "Adicionando hosts ansible"
#editando arquivo de hosts
cat << EOT >> /etc/ansible/hosts
[app]
app01
[db]
db01
EOT

echo "Instalando dependencias ansible"
ansible-galaxy collection install community.general
ansible0galaxy role install geerlingguy.mysql

echo "Gerando chave publica"
#gerando chave compartilhada
ssh-keygen -t rsa -N '' -f /home/vagrant/.ssh/id_rsa -C "vagrant@control-node"
chmod -R +rw /home/vagrant/.ssh
mkdir -p /vagrant/ssh
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/ssh
