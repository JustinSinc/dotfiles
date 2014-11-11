#!/bin/bash

echo -e "\n\nPlease enter username:\n\n"

read username

clear

echo -e "\n\n"

userdel -r $username

clear

echo -e "\n\nRemoving Apache config.\n\n"
rm /etc/apache2/sites-available/$username
rm /etc/apache2/sites-enabled/$username
rm -rf /var/log/apache2/$username
rm -rf /var/www/$username
rm /var/www/files/$username

service apache2 reload

echo -e "User $username removed\n\n"
