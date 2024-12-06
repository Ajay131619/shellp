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
    echo -e "now the script is $y started installing $n"
    
else
    echo -e "$r you are not root user $n"
    echo -e " please run this script with $y sudo access $n"
    exit 1
fi
}

validation(){
if [ $1 -eq 0 ]
then
    echo -e "installation of $2 is $g successfully done!! $n"
else
    echo -e "installation of $2 is $r failed!! $n"
    echo "$y check it once $n"
fi
}

installation(){
for package in $@
do 
  echo -e "$y checking the package is already installed or not $n"
  dnf list installed $package
  
  if [ $? -eq 0 ]
  then
      echo -e "package $package is $y already installed $n"
  else
      dnf install $package -y 
      echo -e "going to $y install $package $n"
  fi
  validation $? $package
done
}

ACCESS
installation $@
