#!/bin/bash
DATESTAMP=$(date +%Y-%m-%d)
PASS="mypassword"
mkdir -p /backup/dailybackup/
cd /backup/dailybackup/
mysqldump -u DBUserName -h DB.rds.amazonaws.com -p$PASS --all-databases | gzip > alldatabases.$DATESTAMP.sql.gz
find /backup/dailybackup/ -type f -mtime +6 -delete
