#!/bin/bash

echo "analysing log files"
echo "==================="

echo "List of log files updated in the last 24 hours"
find . -name "*.log" -mtime -1

echo "searching ERROR logs in application.log file"
grep "ERROR" application.log

echo "Number of ERRORS logs found in application.log"
grep -c "ERROR" application.log

echo "Number of FATAL logs found in application.log"
grep -c "FATAL" application.log

echo "Number of ERRORS logs found in application.log"
grep -c "FATAL" system.log

echo "Number of CRITICAL logs found in system.log"
grep -c "CRITICAL" system.log

echo "CRITICAL logs in system.log"
grep "CRITICAL" system.log