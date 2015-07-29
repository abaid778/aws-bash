#!/bin/bash
DATESTAMP=$(date +%Y-%m-%d)
cd /back/dailybackup/
tar -zcvf "allwebsite.$(date +%m-%d-%y).tar.gz" /var/www/html/
tar -zcvf "apacheconfig.$(date +%m-%d-%y).tar.gz" /etc/apache2/sites-available/
find /back/dailybackup/ -type f -mtime +6 -delete

