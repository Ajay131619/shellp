#!/bin/bash

# name :: ajay 

# date :: Fri, Dec  6, 2024  1:06:08 PM

# script name :: operators and variables 

# here goes the script 

num1=$1
num2=$2

sum=$((num1+num2))
sub=$((num1-num2))
mul=$((num1*num2))
div=$((num1/num2))
mod=$((num1%num2))
exp=$((num1**num2))


echo "sum of $num1 and $num2 is $sum"
echo "sub of $num1 and $num2 is $sub"
echo "mul of $num1 and $num2 is $mul"
echo "div of $num1 and $num2 is $div"
echo "mod of $num1 and $num2 is $mod"
echo "exp of $num1 and $num2 is $exp"

