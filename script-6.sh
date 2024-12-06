#!/bin/bash

# name :: ajay

# date :: Fri, Dec  6, 2024  1:23:33 PM

# script name :: reading variables and printing variables

# here goes the script

# you can also give like this :: 

# echo "enter your name :"
# read name 



read -p " please enter your name :: "  name


echo " welcome the AJ's script $name "

read -p " please enter your email :: " email 

echo " enter your password :: " 
read -s password

# here s is used to keep the password or whatever you entered hide 

echo " your email is :: $email"
echo " your password that you have been entered is :: $password"