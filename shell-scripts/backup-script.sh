#!/bin/bash

#This tells Linux to execute the script using the Bash shell.

SOURCE="/home/ubuntu/source"

#SOURCE is a variable.
#It stores the path of the directory you want to back up.
#In this example, the folder is /home/ubuntu/source.

DESTINATION="/home/ubuntu/destination/"

#This variable stores the location where you want to save your backups.
#Here, /home/ubuntu/destination/ is the parent directory for your backup folders.

DATE=$(date +%Y-%m-%d_%H-%M-%S)

#This command gets the current date and time and stores it in the DATE variable.

mkdir -p $DESTINATION/$DATE

#mkdir creates a directory.
#-p creates any missing parent directories and avoids an error if the directory already exists.
#$DESTINATION/$DATE combines the two variable values.

cp -r $SOURCE $DESTINATION/$DATE

#This is the command that performs the backup.
#cp copies files and directories.
#-r means recursive, so it copies the directory and its contents, including subdirectories.
#$SOURCE identifies the directory being copied.
#$DESTINATION/$DATE identifies the backup folder.

echo "Backup completed on $DATE"

#echo prints a message in the terminal.
#$DATE is replaced with the generated timestamp.



#*****Automation with Cron******

# * * * * * /home/ubuntu/backup.sh

#(Runs every minute. Modify for daily/hourly schedules)
