#!/bin/bash

# clear screen
clear

# garbled mess to scan all connected networks
for network in $(
        for i in `ip a | grep inet | egrep -v "127|inet6" | cut -d " " -f 6 | tr "\r" "\n"`
        do
                echo $i | cut -d "." -f 1 | tr -d "\n"
                echo "." | tr -d "\n"
                echo $i | cut -d "." -f 2 | tr -d "\n"
                echo "." | tr -d "\n"
                echo $i | cut -d "." -f 3 | tr -d "\n"
                echo "." | tr -d "\n"
                echo -e "0/24\n" | tr "\r" "\n"
        done
)
do
        sudo nmap -sn $network
done
