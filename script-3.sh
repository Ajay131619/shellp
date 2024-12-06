#!/bin/bash

# name :: ajay
# date :: Fri, Dec  6, 2024 12:48:53 PM

# script name :: we are going to use the special variables that are already in the bash 

# here goes the script 

echo " to pass all the arguments to the script : $@"
echo " to know how many arguement are passed to the script : $#"
echo " to know the name of the script : $0"
echo " to know the current running pid : $$"
sleep 100 &
echo " to know the pid of last background command :  $!"
echo " to know the current working directory : $PWD"
echo " to know the home directory : $HOME"
