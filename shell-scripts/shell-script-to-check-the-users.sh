#!/bin/bash

#This tells Linux to run the script using Bash.

#This script checks who is logged in, what user accounts exist, who has administrator permissions, and who logged in recently.

echo "=================================="
echo "       LINUX USER CHECK"
echo "=================================="

#echo - prints output on the screen.

echo
echo "--- Current Logged-in Users ---"
who

#who - shows users currently logged in through sessions that the system records.

echo
echo "--- All User Accounts ---"
cut -d: -f1 /etc/passwd

#cut - Extracts a specific part of text
#-d: - Uses the colon: as a separator
#-f1 - Selects the first field
#/etc/passwd - File containing local user-account information

echo
echo "--- Administrator Users (sudo group) ---"
getent group sudo
getent group wheel

#sudo — commonly used on Ubuntu and Debian.
#wheel — commonly used on distributions such as Fedora and some other Linux systems.

echo
echo "--- Recent Logins ---"
last -n 10

#last - displays login records from the system's login history, when available.
#-n 10 - asks it to display up to 10 records.

echo
echo "=================================="
echo "       USER CHECK COMPLETE"
echo "=================================="
