#!/bin/bash

#This tells Linux to execute the script using Bash.

THRESHOLD=10

#This creates a variable named THRESHOLD with a value of 80.
#The script will display a warning when disk usage is greater than or equal to 80%.


df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' |
while read output; do

#df = disk filesystem information.
#-H = human-readable sizes using powers of 1000, such as GB and TB.
#grep searches for matching text.
#-v excludes matching lines.
#-E enables extended regular expressions.
#^Filesystem excludes the header row.
#tmpfs excludes temporary memory-based filesystems.
#cdrom excludes CD-ROM entries.
#The awk command selects specific columns from each line.
#$1 = filesystem name, such as /dev/sda1
#$5 = usage percentage, such as 85%
#This starts a while loop.
#The loop reads each line from the previous command and stores it in the variable output.

usage=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)

#echo $output prints 85% /dev/sda1.
#awk '{ print $1}' extracts 85%.
#cut -d'%' -f1 removes the % symbol and keeps the first field.
#$(...) captures the result and stores it in usage.


partition=$(echo $output | awk '{ print $2 }')

#This extracts the second field from the stored line.

if [ $usage -ge $THRESHOLD ]; then

#This checks whether disk usage is greater than or equal to the threshold.
#if begins the condition.
#[ ... ] evaluates the test.
#-ge means greater than or equal to.
#$usage is the current partition's usage.
#$THRESHOLD is 80.

echo "Warning: Disk usage on $partition is at ${usage}%"

#The echo command prints a message in the terminal.

fi
done

#fi closes the if statement.
#done closes the while loop.
