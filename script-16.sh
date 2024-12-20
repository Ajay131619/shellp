#!/bin/bash

# name :: ajay

# date :: Fri, Dec 20, 2024  5:51:44 PM

# script name :: making the files backup to another folder using shell script

# here goes the script 

# src_dir=$1
# dest_dir=$2
# ts=$(date)
# backup="$dest_dir/backupfiles-$ts.zip"
# days=${3:-14}
# r="\e[31m"
# g="\e[32m"
# y="\e[33m"
# n="\e[0m"

# if [ -d $src_dir ]
# then
#     echo -e "source directory ${g}exists${n}"
# else
#     echo -e "source directory ${r}does not exist${n}"
#     exit 1
# fi

# if [ -d $dest_dir ]
# then
#     echo -e "destination directory ${g}exists${n}"
# else
#     echo -e "destination directory ${r}does not exist${n}"
#     exit 1
# fi

# files=$(find $src_dir -name "*.log" -mtime +$days)
# # echo -e "${y}files_>>${n}"
# # echo "$files"

# if [ ! -z $files ]    #-z is usage is "if the variable is empty then it is true else it is false",! is used as "not equal to"
# then
#     echo -e "${g}files are found$n"
#     find ${src_dir} -name "*.log" -mtime +$days | zip "$backup" -@
#     if [ -f $backup ]
#     then
#         echo "Successfully zippped files older than $days"
#     else
#         echo "Zipping the files is failed"
#         exit 1
#     fi    
# else
#     echo -e "${r}files are not found$n"
#     exit 1
# fi



#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=${2}
DAYS=${3:-14} #if $3 is empty, default is 14 days.
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R USAGE:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}
#check the source and destination are provided

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist...Please check"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist...Please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)

echo "Files: $FILES"

if [ ! -z $FILES ] #true if FILES is empty, ! nakes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zippped files older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi