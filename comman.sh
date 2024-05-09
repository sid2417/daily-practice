#!/bin/bash/

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


FILENAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$FILENAME-$TIMESTAMP.log


VALIDATE()
{
    if [ $1 -ne 0 ]
    then    
        echo  -e "$2 $R FAILURE $N "
        exit 1
    else    
        echo -e "$2 $G SUCCESS $N"
    fi
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R Please Provide user Access $N"
    exit 1
else
    echo -e "$G You already have a SUDO access $N"
fi