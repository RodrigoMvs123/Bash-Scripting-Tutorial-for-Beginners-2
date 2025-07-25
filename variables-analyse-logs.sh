#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

echo "analysing log files"
echo "==================="

echo -e "\nList of log files updated in the last 24 hours"
find $LOG_DIR -name "*.log" -mtime -1

echo -e "\nsearching ERROR logs in application.log file"
grep "ERROR" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of ERRORS logs found in application.log"
grep -c "ERROR" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of FATAL logs found in application.log"
grep -c "FATAL" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\nNumber of ERRORS logs found in application.log"
grep -c "FATAL" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nNumber of CRITICAL logs found in system.log"
grep -c "CRITICAL" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\nCRITICAL logs in system.log"
grep "CRITICAL" "$LOG_DIR/$SYS_LOG_FILE"