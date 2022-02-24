#!/bin/bash

echo "Executando deploy"

yum install -y httpd > /dev/null 2>&1
cp -r /vagrant/hmtl/* /var/www/hmtl/
service httpd start
    