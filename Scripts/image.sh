#!/bin/bash
clear 

# list connected devices
sudo fdisk -l -L=never

# ask user for image source
echo -e "Which file, device or partition would you like to create an image of?\ni.e. /dev/sda, /dev/sdb3\n"

read sourceimage

echo -e "\nYou have selected $sourceimage. Is this correct? (y/n)"

# confirm proper source selection
read srcconfirm

if [ "$srcconfirm" = "n" ]; then
	echo -e "\nTerminating without creating image.\n"
	clear
	exit 1
elif [ "$srcconfirm" != "y" ]; then
	echo -e "\nInvalid response. Please re-run the script.\n"
	exit 1
else 
	echo -e "\nDevice/partition $sourceimage selected.\n"
fi

# hash input file or device
echo -e "$sourceimage SHA512 checksum:"
sudo sha512sum "$sourceimage" | cut -d " " -f1 > sourcehash.sha512
cat sourcehash.sha512

# ask user for image destination
echo -e "\nWhich file/device/partition would you like to output the image to?"

read destinationimage

echo -e "\nYou have selected $destinationimage. Is this correct? (y/n)"

# confirm proper destination selection
read dstconfirm

if [ "$dstconfirm" = "n" ]; then                                                
    echo -e "\nTerminating without creating image.\n"
    exit 1
elif [ "$dstconfirm" != "y" ]; then                                                
    echo -e "\nInvalid response. Please re-run the script.\n"
    exit 1
else 	
	echo -e "\nDevice/partition/file $destinationimage selected.\n"
fi

# give user one last chance
echo -e "Any existing data on $destinationimage will be destroyed. Are you sure you want to continue? (Yes/No)"

read lastchance

if [ "$lastchance" = "No" ]; then                                                
    echo -e "\nTerminating without creating image.\n"         
    exit 1
elif [ "$lastchance" != "Yes" ]; then                                                
    echo -e "\nInvalid response. Please re-run the script.\n"
    exit 1
else 
	echo -e "\nCreating image of $sourceimage and writing to $destinationimage. Using SHA512 hashing algorithm.\n\n"
fi

sudo dcfldd if="$sourceimage" of="$destinationimage"

echo -e "\n\nImage $destinationimage created!\n" 

sudo sha512sum "$destinationimage" | cut -d " " -f1 > destinationhash.sha512

echo -e "$destinationimage SHA512 checksum:\n$(cat destinationhash.sha512)\n"

sudo diff -q sourcehash.sha512 destinationhash.sha512
