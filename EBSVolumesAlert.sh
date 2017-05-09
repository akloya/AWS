#!/bin/bash
# This script send alerts if you have ebs volumes with status "Available"

MailTo=
MailCc=

# DO NOT EDIT ANY THING BELOW THIS LINE.
echo "DevOps Team, Please plan to DELETE volumes with status: AVAILABLE" >ebsvolumes.log
echo "" >>ebsvolumes.log
aws ec2 describe-volumes --filters "Name=status,Values=available" --query Volumes[].[VolumeId,Size] --output=table --profile=buildbranch >>ebsvolumes.log
COUNT=`cat ebsvolumes.log | grep -c "vol-" |awk '{print $1+1}'`
if [ $COUNT == "1" ]; then
echo "NOTHING TO DELETE....."
else
echo "PLAN TO DELETE ASAP for savings"
mail -s 'ALERT! :UNUSED EBS VOLUMES FOUND IN YOUR AWS ACCOUNT' $MailTo -c $MailCc  < ebsvolumes.log
fi
