#!/bin/bash

#Remember to make this shit executable

echo "~##########################"
echo    "Starting LAMP Install"
echo "###########################"

#Update
sudo apt update

# Installs Apache, PHP, MySQL and required packages

sudo apt -y install apache2 php libapache2-mod-php php-mcrypt php-mysql

#Mysql root password to shadowrat5

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password shadowrat5'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password shadowrat5'
sudo apt -y install mysql-server

#Restart all installed services

echo -e "\n"

service apache2 restart && service mysql restart > /dev/null

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Please Check the Install Services, There is some $(tput bold)$(tput setaf 1)Problem$(tput sgr0)"
else
   echo "Installed Services run $(tput bold)$(tput setaf 2)Sucessfully$(tput sgr0)"
fi

echo -e "\n"
