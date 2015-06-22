#!/bin/bash
#Script to create AMI of the instance on daily basis and deleting AMI older than N no of days
#To create a unique AMI name for this script

 echo "instance-`date +%d%b%y`" > /tmp/AMIName.txt

#To create AMI of defined instance
aws ec2 create-image --instance-id i-000000021 --name "`cat /tmp/AMIName.txt`" --description "This is for Daily auto AMI creation" --no-reboot | grep -i amiid >  /tmp/amiID.txt

#Finding AMI older than 3 days which needed to be removed
echo "instance-`date +%d%b%y --date '0 days ago'`" > /tmp/AMIdel.txt

#Finding Image ID of instance which needed to be Deregistered

aws ec2 describe-images --owners self --filters "Name=name,Values=`cat /tmp/AMIdel.txt`" | grep -i ImageId | awk '{ print  $2}' | tr -d ',"' >  /tmp/Imageid.txt


#Find the snapshots attached to the Image need to be Deregister
aws ec2 describe-images --owners self --image-ids `cat /tmp/Imageid.txt` | grep snap | awk '{ print  $2}' | tr -d ',"' > /tmp/snap.txt


#Deregistering the AMI 
aws ec2 deregister-image --image-id `cat /tmp/Imageid.txt`


#Deleting snapshots attached to AMI
for i in `cat /tmp/snap.txt`;do aws ec2 delete-snapshot --snapshot-id $i ; done