#!/bin/bash

DATE=$(date +%Y-%m-%d)
BACKUP_FILE="/backups/apache_backup_$DATE.tar.gz"
LOG_FILE="/var/log/apache_backup.log"

echo "===== Apache Backup: $(date) =====" >> $LOG_FILE

tar -czf $BACKUP_FILE /etc/httpd /var/www/html 2>> $LOG_FILE

# Verify Backup
if tar -tzf $BACKUP_FILE > /dev/null 2>&1; then
    echo "Backup Verified: SUCCESS" >> $LOG_FILE
else
    echo "Backup Verified: FAILED" >> $LOG_FILE
fi

echo "" >> $LOG_FILE
