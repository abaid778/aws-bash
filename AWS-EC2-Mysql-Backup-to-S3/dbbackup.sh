#!/bin/bash
DATESTAMP=$(date +%Y-%m-%d)
PASS="mypassword"
mkdir -p /backup/$DATESTAMP
cd /backup/$DATESTAMP
mysqldump -u root -h DB.rds.amazonaws.com -p$PASS --all-databases | gzip > alldatabases.$DATESTAMP.sql.gz
cd /backup
s3cmd -r put * s3://s3BucketName
rm -rf *
