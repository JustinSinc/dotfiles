#!/bin/bash

if [ $# -lt 1 ]; then
  echo 1>&2 "Please add a new username as an argument."
  exit 2
fi

clear

useradd -m $1 -s /bin/bash

clear

echo -e "\n\n"
passwd $1

clear

echo -e "\n\nSetting up Apache.\n\n"
sed "s/%USER/$1/g" /etc/apache2/sites-available/users > /etc/apache2/sites-available/$1
ln -s /etc/apache2/sites-available/$1 /etc/apache2/sites-enabled/$1
apdir="/var/log/apache2/$1/"
mkdir $apdir
touch "$apdir/access.log"
touch "$apdir/error.log"
chown -R root:$1 $apdir
chmod 750 $apdir
mkdir /var/www/$1
ln -s /var/www/$1 /home/$1/www
chown -R $1:$1 /var/www/$1
service apache2 reload

echo -e "Setting up default webpage.\n\n"
cp /home/public/index.html.sample /home/$1/www/index.html
chown $1:$1 /home/$1/www/index.html
chmod 755 /home/$1/www/index.html

echo -e "Setting up default .bashrc\n\n"
rm /home/$1/.bashrc
ln -s /home/public/bashrc.sample /home/$1/.bashrc
chown $1:$1 /home/$1/.bashrc
