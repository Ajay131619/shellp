#!/bin/bash

# name :: ajay

# date :: Fri, Dec 20, 2024 12:28:36 PM

# script name :: removing the files using shell script

# here goes the script 

src_dir="/var/shelllogs"

r="\e[31m"
g="\e[32m"
y="\e[33m"
N="\e[0m"

if [ -d $src_dir ]
then
    echo -e "source directory $g exists$n"
else
    echo -e "source directory $r does not exist$n"
    exit 1
fi

files=$(find ${src_dir} -name "*.logs" -mtime +14 )
echo -e"$y files_>>$n"
echo "$files"

while IFS= read -r files
do
echo "$file"
done <<$files