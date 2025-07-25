#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"

echo "analysing log files"
echo "==================="

echo -e "\nList of log files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

for LOG_FILE in $LOGS_FILES; do

    echo -e "\n" 
    echo "================================================"
    echo "==================$LOG_FILE====================="
    echo "================================================"

    for PATTERN in ${ERROR_PATTERNS[@]}; do

        echo "\nsearching $PATTERN logs in $LOG_FILE file"
        grep "$PATTERN" "$LOG_FILE"

        echo -e "\nNumber of $PATTERN logs found in $LOG_FILE"
        grep -c "$PATTERN" "$LOG_FILE"
    done
done