#!/bin/bash 

# name :: ajay

# date :: Sat, Dec  7, 2024  7:43:58 PM

# script name :: created a file to store the errors and the successful commands in a log file using "redirectors"
logfolder="/var/log/shell-logs"
timestamp=$(date)
scriptname=$(echo $0 | awk -F "." '{print $1F}')
logfile="$logfolder/$scriptname-$timestamp.log"
mkdir -p $logfolder
userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
N="\e[0m"

#checking the user's id . cuz, In linux only root user can do this kind of tasks

ACCESS(){
if [ $userid -eq 0 ]
then
   
    echo -e "now the script is $y started installing $N" | tee -a $logfile
    
else
    echo -e " $r you are not root user $N" | tee -a $logfile
    echo -e " $r please run this script with sudo access $N" &>> $logfile
    exit 1
fi
}

validation(){
if [ $? -eq 0 ]
then
    echo -e " installation of $package is $g successfully done!! $N" &>> $logfile
else
    echo -e " installation of $package is $r failed!! $N" &>> $logfile
    echo -e "$r check it once $N" &>> $logfile
fi
}

installation(){
 echo "checking the $package is already installed or not"  &>> $logfile
  dnf list installed $package &>> $logfile
  
  if [ $? -eq 0 ]
  then
      echo -e " $package is $y already installed $N" &>> $logfile
  else
      echo -e "$y going to  install $package $N" &>> $logfile
      dnf install $package -y
  fi
  validation &>> $logfile
}

ACCESS

for package in $@
do 
 installation &>> $logfile
done