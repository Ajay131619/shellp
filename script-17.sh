#!/bin/bash
# name :: ajay
# date :: Fri, Dec 20, 2024  9:19:32 PM
# script name :: alerting the disk usage using shell script

disk_usage=$(df -HT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
disk_threshold=20
disk_name=$(df -HT | grep xfs | awk -F " " '{print $NF}')
while IFS= read -r file
do
if [ "$disk_usage" -ge "$disk_threshold" ]
then
echo "Disk usage is high: "$disk_usage"%"
echo "Disk name: $disk_name"
exit 1
fi


done <<< $disk_usage
echo "date:"$(date)""

