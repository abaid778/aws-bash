#!/bin/bash
DATESTAMP=$(date +%Y-%m-%d)
PASS="mypassword"
cd /back/dailybackup/
mysqldump -u root -h DB.rds.amazonaws.com -p$PASS --all-databases | gzip > alldatabases.$DATESTAMP.sql.gz
find /back/dailybackup/ -type f -mtime +6 -delete
