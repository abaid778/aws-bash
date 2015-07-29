# AWS Ec2 web directory and mysql all databases

There is 2 script 1 for the database backup and second for the web directory/apache config. I will also delete the 6 day old file

* `mkdir -p /root/backupscript` --- Create a folder inside the root directory
* `cd /root/backupscript` --- Cd to directory and git clone the db and web directory bash script
* `chmod 700 * ` ---- change the permissions of the scripts 
* `vi /etc/crontab` --- add the script in the crontab
    * `10 3    * * *   root    /root/backupscript/web-apache-backup.sh.sh`
    * `10 5    * * *   root    /root/backupscript/dbbackup.sh `
