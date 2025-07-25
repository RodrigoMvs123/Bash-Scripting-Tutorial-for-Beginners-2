#!/bin/bash

echo "analysing log files"
echo "==================="

echo -e "\nList of log files updated in the last 24 hours"
find . -name "*.log" -mtime -1

echo -e "\nsearching ERROR logs in application.log file"
grep "ERROR" application.log

echo -e "\nNumber of ERRORS logs found in application.log"
grep -c "ERROR" application.log

echo -e "\nNumber of FATAL logs found in application.log"
grep -c "FATAL" application.log

echo -e "\nNumber of ERRORS logs found in application.log"
grep -c "FATAL" system.log

echo -e "\nNumber of CRITICAL logs found in system.log"
grep -c "CRITICAL" system.log

echo -e "\nCRITICAL logs in system.log"
grep "CRITICAL" system.log