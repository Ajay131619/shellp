#!/bin/bash

# name :: ajay

# date :: Fri, Dec  6, 2024  4:28:45 PM

# script name :: using if-conditions and commands from linux now we are going install a software such as mysql

# here goes the script

userid=$(id -u)

#checking the user's id . cuz, In linux only root user can do this kind of tasks

if [ $userid -eq 0 ]
then
    echo "now the script is started installing"
    
else
    echo "you are not root user"
    echo "please run this script with sudo access"
    exit 1
fi

dnf list installed mysql
#checking the software is already installed or not


# installation script is below 

if [ $? -eq 0 ]
then
    echo "mysql is already installed!!"
    echo "nothing to do!!"
    exit 1
else
    echo "mysql is not installed!"
    echo "installation of mysql is initiated!!"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "mysql installed successfully!!"
        exit 1
    else
        echo "mysql installation is failed!!"
        echo "check it once"
        exit 1
    fi
fi