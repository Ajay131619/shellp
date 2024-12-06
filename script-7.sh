#!/bin/bash

name :: ajay

date :: Fri, Dec  6, 2024  1:54:15 PM

script name :: using commands and conditions

date=$(date)

echo "Today's date is $date"

#if condition for checking robot or not (captcha type)

echo "enter the number "20" to access the data "

read -p "enter the number here : " number
if [ $number -eq 20 ]
then
    echo "entered number is $number"
    echo "you entered the equal number"
    echo "data is : $date"
else
    echo "entered number is $number it is lessthan or greater the required number"
    echo "please enter the correct number"
fi