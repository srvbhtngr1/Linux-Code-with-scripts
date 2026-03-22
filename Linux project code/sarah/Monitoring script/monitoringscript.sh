#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"

echo "=============================" >> $LOG_FILE
echo "Date: $(date)" >> $LOG_FILE
echo "=============================" >> $LOG_FILE

echo "---- CPU & Memory Usage ----" >> $LOG_FILE
top -b -n1 | head -10 >> $LOG_FILE

echo "---- Top Processes (CPU) ----" >> $LOG_FILE
ps aux --sort=-%cpu | head -5 >> $LOG_FILE

echo "---- Top Processes (Memory) ----" >> $LOG_FILE
ps aux --sort=-%mem | head -5 >> $LOG_FILE

echo "---- Disk Usage ----" >> $LOG_FILE
df -h >> $LOG_FILE

echo "---- Directory Usage ----" >> $LOG_FILE
du -sh /home/* >> $LOG_FILE 2>/dev/null

echo "" >> $LOG_FILE
