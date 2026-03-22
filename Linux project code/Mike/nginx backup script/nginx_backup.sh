#!/bin/bash

DATE=$(date +%Y-%m-%d)
BACKUP_FILE="/backups/nginx_backup_$DATE.tar.gz"
LOG_FILE="/var/log/nginx_backup.log"

echo "===== Nginx Backup: $(date) =====" >> $LOG_FILE

tar -czf $BACKUP_FILE /etc/nginx /usr/share/nginx/html 2>> $LOG_FILE

# Verify Backup
if tar -tzf $BACKUP_FILE > /dev/null 2>&1; then
    echo "Backup Verified: SUCCESS" >> $LOG_FILE
else
    echo "Backup Verified: FAILED" >> $LOG_FILE
fi

echo "" >> $LOG_FILE
