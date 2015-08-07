#!/bin/bash
DATESTAMP=$(date +%Y-%m-%d)
mkdir -p /backup/dailywebbackup/
cd /backup/dailywebbackup/
tar -zcvf "allwebsite.$(date +%m-%d-%y).tar.gz" /var/www/html/
tar -zcvf "apacheconfig.$(date +%m-%d-%y).tar.gz" /etc/apache2/sites-available/
find /backup/dailywebbackup/ -type f -mtime +6 -delete

