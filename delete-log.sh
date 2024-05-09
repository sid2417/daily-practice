#!/bin/bash

SOURCE_DIRECTORY=/tmp/

if [ -d $SOURCE_DIRECTORY ]
then
    echo "$SOURCE_DIRECTORY is exit"
else
    echo "Please make sure your directory path  "
    exit 1
fi

FILENAME=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while IFS= read -r LINE
do 
    echo "We are deleting the file : $LINE"
    rm -rf $LINE
done <<< $FILENAME