#!/bin/bash

#This tells Linux to run the script using Bash.

THRESHOLD=90

#sets the warning limit to 90%.

echo "=================================="
echo "      LINUX STORAGE CHECK"
echo "=================================="

#echo displays the output on the screen.

echo
echo "--- Disk Space Usage ---"

df -h

#The df command shows disk space information.
#The -h option means human-readable, so sizes appear in GB and MB instead of raw bytes.

echo
echo "--- Storage Warnings ---"

df -P -x tmpfs -x devtmpfs -x squashfs | awk -v limit="$THRESHOLD" '
NR > 1 {
    usage = $5
    gsub(/%/, "", usage)

    if (usage >= limit) {
        printf "WARNING: %s is %s%% full (Mounted on %s)\n", $1, usage, $6
        warning = 1
    }
}
END {
    if (!warning)
        print "OK: All checked filesystems are below 90% usage."
}

#df displays filesystem usage.
#-P keeps the output in a predictable format for scripts.
#-x tmpfs excludes temporary memory-based filesystems.
#-x devtmpfs excludes device-related temporary filesystems.
#-x squashfs excludes read-only SquashFS filesystems.
#This passes your threshold value, 95, into awk as a variable called limit.
#NR is the current line number. NR > 1 tells awk to process all lines except the first heading line.
#$5 means the fifth column, which contains the usage percentage.
#gsub(/%/, "", usage) removes the % symbol so the value can be compared as a number.
#if (usage >= limit) This checks whether usage is greater than or equal to 90.
#$1 is the filesystem name.
#usage is its usage percentage.
#$6 is the mount point.
#warning = 1 remembers that a warning was found.
#END runs after awk finishes processing all rows.
#!warning means no warning was recorded.
#One small detail: the message says “below 90%,” which is correct for the normal case, but the check actually applies to the configured THRESHOLD. If you change the threshold to 90, the message will still say 90%.

'

echo
echo "--- Inode Usage ---"
df -ih

#An inode is like a record that Linux uses to keep track of a file.
#A disk can have free storage space but still be unable to create new files if it runs out of inodes.

echo
echo "      STORAGE CHECK COMPLETE"
echo "=================================="

#These commands print the final message and a closing line.
#They do not perform another storage check.
