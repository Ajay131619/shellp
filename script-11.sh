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


# installation script is below 
INSTALLATION(){
for software in $@
do

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

done
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

dnf list installed $software
#checking the software is already installed or not

INSTALLATION

VALIDATION