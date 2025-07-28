## Bash Scripting Tutorial for Beginners 2  

- https://www.youtube.com/watch?v=PNhq_4d-5ek 

#### Setting Up 

# Bash on Windows

There are two main ways to set up and use Bash on a Windows system:

---

#### 1. Windows Subsystem for Linux (WSL)

- Open **PowerShell as Administrator** and run:
```bash
wsl --install
```

This installs Ubuntu by default, which includes Bash. After installation, restart your computer. Open the Ubuntu application from your Start menu to access Bash.

#### 2. Git Bash

Download and install Git for Windows from:
- https://git-scm.com/download/win

During installation, accept the default options. After installation, you can use "Git Bash" from your Start menu.

**Bash Terminal**

```bash
$mkdir logs
mkdir: logs: File exists
$ls logs/
application.log system.log
```

#### Manual Log Analysis with Commands

```bash
$cd logs
$cat application.log

... 
    ERROR ... 
        CRITICAL ...
                FATAL ...

$grep "ERROR" application.log

... 
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...

$grep -c "ERROR" application.log
4

$grep -c "FATAL" application.log
2

$grep -c "CRITICAL" application.log
1

$grep -c "ERROR" system.log
1

$grep -c "FATAL" system.log
2

$grep -c "ERROR" system.log
2

$grep -c "CRITICAL" system.log
0
```

#### Logs files that has been updated in the last 24 hours

```bash
$ find . -name *.log -mtime -1
find: system.log: unknown primary or operator 
$ find . -name "*.log" -mtime -1
/system.log
/application.log
```

Command Breakdowns

> find . -name "*.log" -mtime -1
Find all .log files modified in the last 24 hours.

> grep "ERROR" application.log
Search for the keyword ERROR in application.log.

> grep -c "ERROR" application.log
Count how many times ERROR appears in application.log.

> grep -c "FATAL" application.log
Count how many times FATAL appears in application.log.

> grep -c "FATAL" system.log
Count how many times FATAL appears in system.log.

> grep -c "CRITICAL" system.log
Count how many times CRITICAL appears in system.log.

> grep "CRITICAL" system.log
Search for the keyword CRITICAL in system.log.

## Introduction to Shell Script
> Logic defined once

> Run with a **single command**

> **No manual** repetition

> **Automates** repetitive tasks

> Ensures **consistent execution**

> Suports **error handling** 

> Act as **process documentation**

```bash
touch analyse-logs.sh

vim analyse-logs.sh

find . -name "*.log" -mtime -1
grep "ERROR" application.log
grep -c "ERROR" application.log
grep -c "FATAL" application.log
grep -c "FATAL" system.log
grep -c "CRITICAL" system.log
grep "CRITICAL" system.log

~
~
~
~
~
~
~

I ( Insert Mode)
Esc
:wq ( Enter )
```

Command Breakdowns

> find . -name "*.log" -mtime -1
Find all .log files modified in the last 24 hours.

> grep "ERROR" application.log
Search for the keyword ERROR in application.log.

> grep -c "ERROR" application.log
Count how many times ERROR appears in application.log.

> grep -c "FATAL" application.log
Count how many times FATAL appears in application.log.

> grep -c "FATAL" system.log
Count how many times FATAL appears in system.log.

> grep -c "CRITICAL" system.log
Count how many times CRITICAL appears in system.log.

> grep "CRITICAL" system.log
Search for the keyword CRITICAL in system.log.

```bash
$ ./analyse-logs.sh: Permition definied
$ chmod +x analyse-logs.sh
$ ./analyse-logs.sh   
/system.log
/application.log
    ERROR ...
    ERROR ...  
    ERROR ...
    ERROR ...
...
4
2
1
1
2
2
0
...
```

Command Breakdown
> touch analyse-logs.sh
Create a new, empty file named analyse-logs.sh.

> vim analyse-logs.sh
Open the script in the vim editor to add your Bash commands.

> ./analyse-logs.sh
Attempt to run the script, may result in a, Permission denied, error if it's not executable yet.

> chmod +x analyse-logs.sh
Grant execute permission to the file.

> chmod
Changes file permissions.

> +x
Adds the execute permission.

> analyse-logs.sh
The target script file.

#### File Extension and Shebang Statement

analyse-logs.sh

```bash
#!/bin/bash ( Shebang for Bash scripts )
#!/bin/sh   ( Shebang for POSIX shell scripts )
```

#### Formatting and Readability Improvements

```bash
$ cat analyse-logs.sh

find . -name "*.log" -mtime -1

grep "ERROR" application.log
grep -c "ERROR" application.log
grep -c "FATAL" application.log

grep -c "FATAL" system.log
grep -c "CRITICAL" system.log
grep "CRITICAL" system.log
```

**echo command** 
"echo" is a built-in command used to print text or variables to the terminal ( standard output ).

```bash 
$ vim analyse-logs.sh
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
~
~
~
~
~
~
~
~

I ( Insert Mode)
Esc
:wq ( Enter )
``` 

```bash
$ ./analyse-logs.sh
analysing log files
===================
List of log files updated in the last 24 hours
./system.log
./application.log
searching ERROR logs in application.log file 
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERRORS logs found in application.log
4
Number of FATAL logs found in application.log
2
Number of ERRORS logs found in application.log 
1
Number of CRITICAL logs found in system.log
2
```

> echo -e "\n" -> add new line

```bash
$ $ vim analyse-logs.sh
#!/bin/bash

echo "analysing log files"
echo "==================="

echo -e "\nList of log files updated in the last 24 hours"
find . -name "*.log" -mtime -1

echo -e"\nsearching ERROR logs in application.log file"
grep -c "ERROR" application.log

echo -e "\nNumber of ERRORS logs found in application.log"
grep -c "ERROR" application.log

echo -e "\nNumber of FATAL logs found in application.log"
grep -c "FATAL" application.log

echo -e "\nNumber of ERRORS logs found in application.log"
grep -c "FATAL" system.log

echo -e "\nNumber of CRITICAL logs found in system.log"
grep -c "CRITICAL" system.log

echo -e "\nCRITICAL logs in system.log"
grep -c "CRITICAL" system.log
~
~
~
~
~
~
~
~

I ( Insert Mode)
Esc
:wq ( Enter )
``` 

```bash
$ ./analyse-logs.sh
analysing log files
===================
List of log files updated in the last 24 hours
./system.log
./application.log
searching ERROR logs in application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERRORS logs found in application.log
4
Number of FATAL logs found in application.log
2
Number of ERRORS logs found in application.log
1
Number of CRITICAL logs found in system.log
2
CRITICAL logs in system.log
    CRITICAL ...
    CRITICAL ...
    CRITICAL ...
```

#### Script improvement: Use Absolute Paths

```bash
$ ls
application.log  analyse-logs.sh  system.log
$ pwd
/home/user/logs
$ mv analyse-logs.sh /home/user/
$ ls
application.log system.log
$ cd ..
$ ./analyse-logs.

find: ./.Trash: Operation not permitted

searching ERROR logs in application.log file
grep: application.log: No such file or directory

Number of ERROR logs found in application.log
grep: application.log: No such file or directory

Number of FATAL logs found in application.log
grep: application.log: No such file or directory

Number of FATAL logs found in system.log
grep: system.log: No such file or directory

Number of CRITICAL logs found in system.log
grep: system.log: No such file or directory

CRITICAL logs in system.log file
grep: system.log: No such file or directory

$ vim analyse-logs.sh
#!/bin/bash

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
find /home/user/logs -name "*.log" -mtime -1

echo -e "/nsearching ERROR logs in application.log file"
grep -c "ERROR" /home/user/logs/application.log

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "ERROR" /home/user/logs/application.log

echo -e "/nNumber of FATAL logs found in application.log"
grep -c "FATAL" /home/user/logs/application.log

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "FATAL" /home/user/logs/system.log

echo -e "/nNumber of CRITICAL logs found in system.log"
grep -c "CRITICAL" /home/user/logs/system.log

echo -e "/nCRITICAL logs in system.log"
grep -c "CRITICAL" /home/user/logs/system.log
~
~
~
~
~
~
~
~

I ( Insert Mode)
Esc
:wq ( Enter )

$ ./analyse-logs.
analysing log files
===================
List of log files updated in the last 24 hours
./system.log
./application.log
searching ERROR logs in application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERRORS logs found in application.log
4
Number of FATAL logs found in application.log
2
Number of ERRORS logs found in application.log
1
Number of CRITICAL logs found in system.log
2
CRITICAL logs in system.log
    CRITICAL ...
    CRITICAL ...
    CRITICAL ...
```

#### Using Variables in Bash Scripts

```bash
$ vim analyse-logs.sh
#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
find $LOG_DIR -name "*.log" -mtime -1

echo -e "/nsearching ERROR logs in application.log file"
grep -c "ERROR" "$LOG_DIR/APP_LOG_FILE"

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "ERROR" "$LOG_DIR/APP_LOG_FILE"

echo -e "/nNumber of FATAL logs found in application.log"
grep -c "FATAL" "$LOG_DIR/APP_LOG_FILE"

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "FATAL" "$LOG_DIR/SYS_LOG_FILE"

echo -e "/nNumber of CRITICAL logs found in system.log
grep -c "FATAL" "$LOG_DIR/SYS_LOG_FILE"

echo -e "/nNumber of CRITICAL logs found in system.log"
grep -c "CRITICAL" "$LOG_DIR/SYS_LOG_FILE"

echo -e "/nCRITICAL logs in system.log"
grep -c "CRITICAL" "$LOG_DIR/SYS_LOG_FILE
~
~
~
~
~
~
~
~

I ( Insert Mode)
Esc
:wq ( Enter )

$ ./analyse-logs.
analysing log files
===================
List of log files updated in the last 24 hours
./system.log
./application.log
searching ERROR logs in application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERRORS logs found in application.log
4
Number of FATAL logs found in application.log
2
Number of ERRORS logs found in application.log
1
Number of CRITICAL logs found in system.log
2
CRITICAL logs in system.log
    CRITICAL ...
    CRITICAL ...
    CRITICAL ...
```

#### Using Arrays in Bash Scripts

#### Visual Studio Code

```
Explorer
Open Editors
analyse-logs.sh
```

```bash
$ vim analyse-logs.sh
#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

echo "/nsearching ERROR logs in application.log file"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/APP_LOG_FILE"}$" 

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/APP_LOG_FILE"

echo -e /nNumber of FATAL logs found in application.log"
grep -c ${ERROR_PATTERNS[1]}" "$LOG_DIR/APP_LOG_FILE"

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c ${ERROR_PATTERNS[1]}" "$LOG_DIR/SYS_LOG_FILE"

echo -e "/nNumber of CRITICAL logs found in system.log
grep -c ${ERROR_PATTERNS[1]}" "$LOG_DIR/SYS_LOG_FILE"

echo -e "/nNumber of CRITICAL logs found in system.log"
grep -c ${ERROR_PATTERNS[2]}" "$LOG_DIR/SYS_LOG_FILE"

echo -e "/nCRITICAL logs in system.log"
grep -c ${ERROR_PATTERNS[2]}" "$LOG_DIR/SYS_LOG_FILE"
~
~
~
~
~
~
~
~

I ( Insert Mode)
Esc
:wq ( Enter )

$ ./analyse-logs.
analysing log files
===================
List of log files updated in the last 24 hours
./system.log
./application.log
searching ERROR logs in application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERRORS logs found in application.log
4
Number of FATAL logs found in application.log
2
Number of ERRORS logs found in application.log
1
Number of CRITICAL logs found in system.log
2
CRITICAL logs in system.log
    CRITICAL ...
    CRITICAL ...
    CRITICAL ...

$ cat analyse-logs.sh
#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

echo "/nsearching ERROR logs in application.log file"
grep "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "${ERROR_PATTERNS[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "/nNumber of FATAL logs found in application.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "/nNumber of ERRORS logs found in application.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "/nNumber of CRITICAL logs found in system.log"
grep -c "${ERROR_PATTERNS[1]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "/nNumber of CRITICAL logs found in system.log"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "/nCRITICAL logs in system.log"
grep -c "${ERROR_PATTERNS[2]}" "$LOG_DIR/$SYS_LOG_FILE"
```

#### Loops in Bash Scripts

> Loops are used to repeat a set of commands multiple times, either for a fixed number of times, or for every item in a list ( like a file, array or command output).

```bash
#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

for LOG_FILE in $LOG_FILES; do
    echo "/nsearching ${ERROR_PATTERNS[0]} logs in $LOG_FILES file"
    grep "${ERROR_PATTERNS[0]}" "$LOG_FILE"

    echo -e "/nNumber of ${ERROR_PATTERNS[0]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[0]}" "$LOG_FILE"

    echo "/nsearching ${ERROR_PATTERNS[1]} logs in $LOG_FILES file"
    grep "${ERROR_PATTERNS[1]}" "$LOG_FILE"

    echo -e "/nNumber of ${ERROR_PATTERNS[1]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[1]}" "$LOG_FILE"

    echo "/nsearching ${ERROR_PATTERNS[2]} logs in $LOG_FILES file"
    grep "${ERROR_PATTERNS[2]}" "$LOG_FILE"

    echo -e "/nNumber of ${ERROR_PATTERNS[2]} logs found in $LOG_FILE"
    grep -c "${ERROR_PATTERNS[2]}" "$LOG_FILE
done

$ analyse-logs.sh 
analysing log files
===================
List of log files updated in the last 24 hours
/home/user/logs/system.log
/home/user/logs/application.log

searching ERROR logs in /home/user/logs/system.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/system.log
4
searching FATAL logs in /home/user/logs/system.log file     
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/system.log
2
searching CRITICAL logs in /home/user/logs/system.log file
    CRITICAL ...
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/system.log
0
searching ERROR logs in /home/user/logs/application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/application.log
4
searching FATAL logs in /home/user/logs/application.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/application.log
2
searching CRITICAL logs in /home/user/logs/application.log file
    CRITICAL ...    
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/application.log
0
```

```bash
#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

for LOG_FILE in $LOG_FILES; do

    for PATTERN in ${ERROR_PATTERNS[@]}; do


        echo "/nsearching $PATTERN logs in $LOG_FILES file"
        grep "$PATTERN" "$LOG_FILE"

        echo -e "/nNumber of $PATTERN logs found in $LOG_FILE"
        grep -c "$PATTERN" "$LOG_FILE"
    done
done

$ analyse-logs.sh
analysing log files
===================
List of log files updated in the last 24 hours
/home/user/logs/system.log
/home/user/logs/application.log
searching ERROR logs in /home/user/logs/system.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/system.log
4
searching FATAL logs in /home/user/logs/system.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/system.log
2
searching CRITICAL logs in /home/user/logs/system.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/system.log
0
searching ERROR logs in /home/user/logs/application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/application.log
4   
searching FATAL logs in /home/user/logs/application.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/application.log   
2
searching CRITICAL logs in /home/user/logs/application.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/application.log
0
```

```bash
#!/bin/bash

LOG_DIR="/home/user/logs"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"

echo "analysing log files"
echo "==================="

echo -e "/nList of log files updated in the last 24 hours"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES"

for LOG_FILE in $LOG_FILES; do

    echo -e "\n" 
    echo "================================================"
    echo "==================$LOG_FILE====================="
    echo "================================================"

    for PATTERN in ${ERROR_PATTERNS[@]}; do


        echo "/nsearching $PATTERN logs in $LOG_FILES file"
        grep "$PATTERN" "$LOG_FILE"

        echo -e "/nNumber of $PATTERN logs found in $LOG_FILE"
        grep -c "$PATTERN" "$LOG_FILE"
    done
done

$ analyse-logs.sh
analysing log files
===================
List of log files updated in the last 24 hours
/home/user/logs/system.log
/home/user/logs/application.log

=======================================================
=================home/user/logs/system.log===============
=======================================================

searching ERROR logs in /home/user/logs/system.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/system.log
4
searching FATAL logs in /home/user/logs/system.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/system.log
2
searching CRITICAL logs in /home/user/logs/system.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/system.log
0

========================================================
=================home/user/logs/application.log===========
========================================================

searching ERROR logs in /home/user/logs/application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/application.log
4   
searching FATAL logs in /home/user/logs/application.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/application.log   
2
searching CRITICAL logs in /home/user/logs/application.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/application.log
0
```

#### Writing to a File

> **Save output** to a report file

> **Avoid** terminal-only output

> Make it **shareable and Reusable**

```bash
#!/bin/bash

LOG_DIR="/home/user/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"
REPORT_FILE="/home/user/logs/log_analysis_report.txt"

echo "analysing log files" > "$REPORT_FILE"
echo "===================" >> "$REPORT_FILE"

echo -e "/nList of log files updated in the last 24 hours" >> "$REPORT_FILE"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do

    echo -e "\n" >> "$REPORT_FILE"
    echo "================================================" >> "$REPORT_FILE"
    echo "==================$LOG_FILE=====================" >> "$REPORT_FILE"
    echo "================================================" >> "$REPORT_FILE"

    for PATTERN in ${ERROR_PATTERNS[@]}; do


        echo "/nsearching $PATTERN logs in $LOG_FILES file" >> "$REPORT_FILE"
        grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        echo -e "/nNumber of $PATTERN logs found in $LOG_FILE" >> "$REPORT_FILE"
        grep -c "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"
    done
done

echo -e "\nLog analysis completed and report saved in: $REPORT_FILE" 

$ analyse-logs.sh
analysing log files
===================
List of log files updated in the last 24 hours
/home/user/logs/system.log
/home/user/logs/application.log
=======================================================
=================home/user/logs/system.log===============
=======================================================
searching ERROR logs in /home/user/logs/system.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/system.log
4
searching FATAL logs in /home/user/logs/system.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/system.log
2
searching CRITICAL logs in /home/user/logs/system.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/system.log 
0
========================================================
=================home/user/logs/application.log===========
========================================================
searching ERROR logs in /home/user/logs/application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/application.log
4
searching FATAL logs in /home/user/logs/application.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/application.log
2
searching CRITICAL logs in /home/user/logs/application.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/application.log
0
Log analysis completed and report saved in: /home/user/logs/log_analysis_report.txt

$ cat /home/user/logs/log_analysis_report.txt
analysing log files
===================
List of log files updated in the last 24 hours
/home/user/logs/system.log
/home/user/logs/application.log
=======================================================
=================home/user/logs/system.log===============
======================================================= 
searching ERROR logs in /home/user/logs/system.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/system.log
4
searching FATAL logs in /home/user/logs/system.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/system.log
2
searching CRITICAL logs in /home/user/logs/system.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/system.log
0
========================================================
=================home/user/logs/application.log===========
========================================================
searching ERROR logs in /home/user/logs/application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/application.log
4
searching FATAL logs in /home/user/logs/application.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/application.log
2
searching CRITICAL logs in /home/user/logs/application.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/application.log
0
```

#### Visual Studio Code

log_analysis_report.txt
```txt
analysing log files
===================
List of log files updated in the last 24 hours
/home/user/logs/system.log
/home/user/logs/application.log
=======================================================
=================home/user/logs/system.log===============
=======================================================
searching ERROR logs in /home/user/logs/system.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/system.log
4
searching FATAL logs in /home/user/logs/system.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/system.log        
2
searching CRITICAL logs in /home/user/logs/system.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/system.log
0
========================================================
=================home/user/logs/application.log===========
========================================================
searching ERROR logs in /home/user/logs/application.log file
    ERROR ...
    ERROR ...
    ERROR ...
    ERROR ...
Number of ERROR logs found in /home/user/logs/application.log
4
searching FATAL logs in /home/user/logs/application.log file
    FATAL ...
    FATAL ...
Number of FATAL logs found in /home/user/logs/application.log
2
searching CRITICAL logs in /home/user/logs/application.log file
    CRITICAL ...
    CRITICAL ...
Number of CRITICAL logs found in /home/user/logs/application.log
0
```

#### Conditionals ( if statments )

```bash
#!/bin/bash

LOG_DIR="/home/user/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL") # [0] "ERROR", [1] "FATAL", [2] "CRITICAL"
REPORT_FILE="/home/user/logs/log_analysis_report.txt"

echo "analysing log files" > "$REPORT_FILE"
echo "===================" >> "$REPORT_FILE"

echo -e "/nList of log files updated in the last 24 hours" >> "$REPORT_FILE"
LOGS_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOGS_FILES" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do

    echo -e "\n" >> "$REPORT_FILE"
    echo "================================================" >> "$REPORT_FILE"
    echo "==================$LOG_FILE=====================" >> "$REPORT_FILE"
    echo "================================================" >> "$REPORT_FILE"

    for PATTERN in ${ERROR_PATTERNS[@]}; do


        echo "/nsearching $PATTERN logs in $LOG_FILES file" >> "$REPORT_FILE"
        grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

        echo -e "/nNumber of $PATTERN logs found in $LOG_FILE" >> "$REPORT_FILE"

        ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
        echo $ERROR_COUNT >> "$REPORT_FILE"
    
        if ["#ERROR_COUNT" -gt 10 ]; then
            echo -e "\n  ⚠ Action Required: Too many $PATTERN issues in log file $LOG_FILE" 
        fi
    done
done

echo -e "\nLog analysis completed and report saved in: $REPORT_FILE" 

$ analyse-logs.sh

    ⚠ Action Required: Too many ERROR errors in log file /home/user/logs/system.log

log analysis completed and report saved in: /home/user/logs/log_analysis_report.txt
```



