#!/bin/bash
# Interactive user-adding script for basic shell service

echo -e "\n\nPlease enter username:\n\n"

read username

clear

useradd -m $username -s /bin/bash

clear

echo -e "\n\n"
passwd $username

clear

echo -e "\n\nSetting up Apache.\n\n"
sed "s/%USER/$username/g" /etc/apache2/sites-available/users > /etc/apache2/sit$
ln -s /etc/apache2/sites-available/$username /etc/apache2/sites-enabled/$userna$
apdir="/var/log/apache2/$username/"
mkdir $apdir
touch "$apdir/access.log"
touch "$apdir/error.log"
chown -R root:$username $apdir
chmod 750 $apdir
mkdir /var/www/$username
ln -s /var/www/$username /home/$username/www
chown -R $username:$username /var/www/$username
service apache2 reload

echo -e "Setting up default webpage.\n\n"
cp /home/public/index.html.sample /home/$username/www/index.html
chown $username:$username /home/$username/www/index.html
chmod 755 /home/$username/www/index.html

echo -e "Setting up filesharing.\n\n"
mkdir /home/$username/files
ln -s /home/$username/files /var/www/files/$username

echo -e "Setting up default .bashrc\n\n"
rm /home/$username/.bashrc
ln -s /home/public/bashrc.sample /home/$username/.bashrc
chown $username:$username /home/$username/.bashrc
