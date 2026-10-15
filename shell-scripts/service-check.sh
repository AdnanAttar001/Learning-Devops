#!/bin/bash

#This tells Linux to execute the script using Bash.

SERVICE="nginx"

#SERVICE is a variable.
#"nginx" is the name of the service you want to monitor.

if systemctl is-active --quiet $SERVICE; then

#if starts a conditional statement.
#systemctl manages services on Linux systems using systemd.
#is-active checks whether the service is active.
#--quiet suppresses normal output and returns an exit status.
#$SERVICE is replaced with nginx.
#then begins the commands that execute if the condition is true.

echo "$SERVICE is running"

#echo prints the message in your terminal.

else

#else runs when the if condition is false — for example, if Nginx is stopped or not active.

echo "$SERVICE is not running"

#If Nginx is inactive, the script displays

systemctl start $SERVICE
fi
