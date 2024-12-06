#!/bin/bash 

# name :: ajay

# date :: Fri, Dec  6, 2024  7:01:26 PM

# script name :: installing several kinds of software or packages or tools at single time 

userid=$(id -u)

#checking the user's id . cuz, In linux only root user can do this kind of tasks

ACCESS(){

if [ $userid -eq 0 ]
then
    echo "now the script is started installing"
    
else
    echo "you are not root user"
    echo "please run this script with sudo access"
    exit 1
fi
}

validation(){
if [ $1 -eq 0 ]
then
    echo "installation of $2 is done!!"
else
    echo "installation of $2 is failed!!"
    echo "check it once"
}
installation(){
for package in $@
do 
  dnf list installed $package
  if [ $? -eq 0 ]
  then
      echo "package $package is already installed"
  else
      dnf install $package -y 
  fi
  validation $? $package
done
}

ACCESS
installation $@
