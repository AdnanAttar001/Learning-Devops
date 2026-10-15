#!/bin/bash

#This tells that the script will be execute through the bash.

URL="https://github.com"

#It stores the website you want to monitor.
#You can change it to another website, such as https://google.com

LOG_DIR="$HOME/website_health_logs"

#$HOME is your home directory.
#website_health_logs is the folder created inside it.

mkdir -p "$LOG_DIR"

#mkdir creates a directory.
#-p creates missing parent directories and does not report an error if the directory already exists.
#"$LOG_DIR" specifies the directory path.

TODAY=$(date +"%Y-%m-%d")

#This command gets the current date and stores it in TODAY.

LOG_FILE="$LOG_DIR/health_log_$TODAY.log"

#This builds the complete path to the daily log file.

response=$(curl -o /dev/null -s -A "Mozilla/5.0" -w "%{http_code} %{time_total}" "$URL")

#This is the most important line in the script.
#curl	Sends a request to the website
#-o /dev/null	Discards the response body instead of saving the webpage
#-s	Runs silently, suppressing the normal progress display
#-A "Mozilla/5.0"	Sets the HTTP User-Agent header
#-w	Prints selected information about the request
#%{http_code}	Outputs the HTTP status code
#%{time_total}	Outputs the total request time in seconds
#"$URL"	Specifies the target website

status_code=$(echo "$response" | awk '{ print $1 }')

#echo "$response" prints the response string.
#| sends that output to the next command.
#awk '{ print $1 }' extracts the first whitespace-separated field.

response_time=$(echo "$response" | awk '{ print $2 }')

#This works similarly, but $2 selects the second field.

timestamp=$(date +"%Y-%m-%d %H:%M:%S")

#This is useful for tracking exactly when a website check occurred.

echo "$timestamp | Status: ${status_code} | Response Time: ${response_time}s" >> "$LOG_FILE"

#echo prints the log message.
#${status_code} inserts the actual HTTP status code.
#${response_time} inserts the response time.
#>> appends the output to the log file without overwriting existing entries.
#"$LOG_FILE" specifies the destination.
