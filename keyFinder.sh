#!/bin/bash
# Created by Wolfgang Müller
# Computer Engineering BA (C), Final Project, 15 Credits

echo "Enter the MAC address of the target router and press enter: "
read MAC
echo "Enter the file name of the password list and press enter: "
read psw_list_name
echo "Enter the file name of the cap file and press enter: "
read cap_file_name

aircrack-ng -a2 -b ${MAC} -w ${psw_list_name} ${cap_file_name} -l key_found.txt

if [[ -f key_found.txt ]]
then
value=$(<key_found.txt)

RED='\033[1;31m'
NC='\033[0m'
echo -e "${RED}WARNING - KEY FOUND!${NC}"
echo "Immediately change the password to a cryptographically secure password together with an MAC whitelist."
echo "If changing password isn't an option, consider at least using a MAC whitelist." 
echo "Read the manual of your router model on how to implement a MAC whitelist."
rm key_found.txt
exit;
fi

if [[ ! -f key_found.txt  ]]
then
echo "No match found."
echo "This does not mean that you have an secure password, this only means that there is no match with the given password list>
exit;
fi
