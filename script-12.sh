#!/bin/bash 

# name :: ajay

# date :: Fri, Dec  6, 2024 10:26:15 PM

# script name :: adding the colour to the script for better visuals

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"

#checking the user's id . cuz, In linux only root user can do this kind of tasks

ACCESS(){

if [ $userid -eq 0 ]
then
    echo -e "now the script is $y started installing $N"
    
else
    echo -e " $r you are not root user $N"
    echo -e " $r please run this script with sudo access $N"
    exit 1
fi
}

validation(){
if [ $1 -eq 0 ]
then
    echo -e " installation of $2 is $g successfully done!! $N"
else
    echo -e " installation of $2 is $r failed!! $N"
    echo -e "$r check it once $N"
fi
}

installation(){
for package in $@
do 
  echo "checking the $package is already installed or not"
  dnf list installed $package
  
  if [ $? -eq 0 ]
  then
      echo -e " $package is $y already installed $N"
  else
      echo -e "$y going to  install $package $N"
      dnf install $package -y
  fi
  validation $? $package
done
}

ACCESS
installation $@
