#!/bin/bash
#Note () is for character dialoge while [] is for system dialoge
#Change user dir to the current folder (unixMon)
source .start
#Colored Text
CHARACTER='\033[0;34m'
CONSOLE='\033[0;31m'
DEFAULT='\033[0m'
clear
echo -e "${CONSOLE}\n██    ██ ███    ██ ██ ██   ██               ███    ███  ██████  ███    ██ \n██    ██ ████   ██ ██  ██ ██                ████  ████ ██    ██ ████   ██ \n██    ██ ██ ██  ██ ██   ███       █████     ██ ████ ██ ██    ██ ██ ██  ██ \n██    ██ ██  ██ ██ ██  ██ ██                ██  ██  ██ ██    ██ ██  ██ ██ \n ██████  ██   ████ ██ ██   ██               ██      ██  ██████  ██   ████${DEFAULT}"
echo -e "\n\nWelcome to Unix-Mon!"
echo "-------------------------------"
echo "In this Lark game you are a unix-mon researcher working with your grandfather. He approaches you with a question." 

cat << EOF
(Grandfather): Hey kiddo do you think you can help me out? I'm currently researching Unix-Mon in the area and was wondering if you would like to catch some for me?

EOF
printf "Do you want to help? Y/N "

read RESP

if [ "$RESP" = "y" -o "$RESP" = "Y" ]; then
	echo -e "${CHARACTER}(Grandfather): Alright! Let's get you some gear to prepare.${DEFAULT}"
	echo -e "${CONSOLE}[System]: Equiped Map x1 ${DEFAULT}"
else
	echo -e "${CHARACTER}(Grandfather): Oh okay...${DEFAULT}"
	exit;
fi

echo -e "${CHARACTER}(Grandfather): Here's the map of the area, use 'ls' to look at the nearby sights, 'cd' to head in the direction of the sight, and './(file name)' to interact. I hope you have fun kiddo.${DEFAULT}"