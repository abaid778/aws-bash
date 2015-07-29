# AWS Ec2  mysql all databases backup to the S3 bucket

## S3 setup on Ec2

* `sudo apt-get install s3cmd` --- it will install the s3cmd on debian based server
* `s3cmd --configure` --- configure the Access and screct key
* `s3cmd ls` --- to check the buckets

## Script Setup

* `mkdir -p /root/backupscript` --- Create a folder inside the root directory
* `cd /root/backupscript` --- Cd to directory and git clone the db and web directory bash script
* `chmod 700 * ` ---- change the permissions of the scripts 
* `vi /etc/crontab` --- add the script in the crontab
    * `10 5    * * *   root    /root/backupscript/dbbackup.sh `
