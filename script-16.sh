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
#  #-z is usage is "if the variable is empty then it is true else it is false",! is used as "not equal to"
# if [ -n $files ]   
# then
#     echo -e "${r}files are not found$n"
#     exit 1        
# else
#     echo -e "${g}files are found$n"
#     find ${src_dir} -name "*.log" -mtime +$days | zip "$backup" -@
#     if [ -f $backup ]
#     then
#         echo "Successfully zippped files older than $days"
#     else
#         echo "Zipping the files is failed"
#         exit 1
#     fi

# fi
#!/bin/bash

# name :: ajay
# date :: Fri, Dec 20, 2024  5:51:44 PM
# script name :: making the files backup to another folder using shell script

src_dir=$1
dest_dir=$2
ts=$(date +"%Y%m%d%H%M%S")
backup="$dest_dir/backupfiles-$ts.zip"
days=${3:-14}
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

# Check if source directory exists
if [ -d "$src_dir" ]; then
    echo -e "source directory ${g}exists${n}"
else
    echo -e "source directory ${r}does not exist${n}"
    exit 1
fi

# Check if destination directory exists
if [ -d "$dest_dir" ]; then
    echo -e "destination directory ${g}exists${n}"
else
    echo -e "destination directory ${r}does not exist${n}"
    exit 1
fi

# Find files older than the specified days
files=$(find "$src_dir" -name "*.log" -mtime +"$days")
# echo -e "${y}files_>>${n}"
# echo "$files"

# Check if files are found
if [ -n "$files" ]; then
    echo -e "${g}files are found$n"
    find "$src_dir" -name "*.log" -mtime +"$days" | zip "$backup" -@
    if [ -f "$backup" ]; then
        echo "Successfully zipped files older than $days days to $backup"
    else
        echo "Zipping the files failed"
        exit 1
    fi    
else
    echo -e "${r}files are not found$n"
    exit 1
fi


