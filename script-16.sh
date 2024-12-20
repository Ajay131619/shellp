#!/bin/bash

# name :: ajay

# date :: Fri, Dec 20, 2024  5:51:44 PM

# script name :: making the files backup to another folder using shell script

# here goes the script 

src_dir=$1
dest_dir=$2
days=${3:-14}
timestamp=$(date)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

if [ -d $src_dir ]
then
    echo -e "source directory ${g}exists${n}"
else
    echo -e "source directory ${r}does not exist${n}"
    exit 1
fi

if [ -d $dest_dir ]
then
    echo -e "destination directory ${g}exists${n}"
else
    echo -e "destination directory ${r}does not exist${n}"
    exit 1
fi
files=$(find $src_dir -name "*.log" -mtime +$days )
echo -e "${y}files_>>${n}"
echo "$files"

if [ ! -z $files ] #-z is usage is "if the variable is empty then it is true else it is false",! is used as "not equal to"
then
    echo -e "${g}files are found$n"
    backup="$dest_dir/backupfiles-$timestamp.zip"
    $(find $src_dir -name "*.log" -mtime +$days ) | zip "$backup" -@
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zippped files older than $DAYS"
    else
        echo "Zipping the files is failed"
        exit 1
    fi    
else
    echo -e "${r}files are not found$n"
    exit 1
fi

