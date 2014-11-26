#!/bin/bash
# Detect current network address, and scan for active hosts on the network

# clear screen
clear

# set date variable
date=`date +%b%d%Y`

# create directory to store scans
mkdir ./$date

# garbled mess of scanning script
for activehost in $(
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
                sudo nmap -sn $network | grep report | cut -d " " -f 5
        done
)
do
    sudo nmap -T4 -A -v $activehost >> ./$date/$activehost.txt && echo -e "\n" >> ./$date/$activehost.txt
done

# clean up any leftover output
clear

# let user know where output has been saved
echo -e "Output saved to ./$date subdirectory."
