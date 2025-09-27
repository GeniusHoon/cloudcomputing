#!/usr/bin/env bash

echo "= Updating System Package ... = "
apt-get update -y
apt-get upgrade -y

echo "= Installing Apache Webserver ... = "
apt-get install -y apache2

echo "= Configuring Apache Service  ... = "
systemctl start apache2
ststemctl enable apache2

echo "= Configuring Web Contents Directory  ... = "
if ! [-L /var/www ]; then
    rm -rf /var/www
    ln -fs /vagrant /var/www
fi

mkdif -p /vagranthtml
chown -R www-data:www-data /vagrant/html
chmod -R 755 /vagrant/html





