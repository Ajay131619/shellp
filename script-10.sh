#!/bin/bash

# name :: ajay 

# date :: Fri, Dec  6, 2024  6:41:37 PM

# script name :: installation of any software or tools using functions

# here goes the script



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

VERIFICATION(){
dnf list installed $software
#checking the software is already installed or not
}

# installation script is below 
INSTALLATION(){
if [ $? -eq 0 ]
then
    echo "$software is already installed!!"
    echo "nothing to do!!"
    exit 1
else
    echo "$software is not installed!"
    echo "installation of $software is initiated!!"
    dnf install $software -y
  
fi
}

VALIDATION(){
         
    dnf list installed $software
    if [ $? -eq 0 ]
    then
        echo "$software installed successfully!!"
        exit 1
    else
        echo "$software installation is failed!!"
        echo "check it once"
        exit 1
    fi
}

#calling the functions

ACCESS

read -p "enter the tool or software you want to install :: " software

VERIFICATION

INSTALLATION

VALIDATION