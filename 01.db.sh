#!/bin/bash/

#color #rootuser #logfile # timestamp 

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]
    then    
        echo  "$2 FAILURE "
        exit 1
    else    
        echo "$2 SUCCESS"
    fi
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please Provide user Access "
else
    echo "You already have a SUDO access"
fi

FILENAME="echo $$" | cut -d "." -f2

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=$FILENAME+$TIMESTAMP+.log

dnf install mysql-server -y
VALIDATE $? "your installation was :"

systemctl enable mysqld
VALIDATE $? "your Enabling was :"

systemctl start mysqld
VALIDATE $? "your Starting was :"

mysql_secure_installation --set-root-pass ExpenseApp@1
VALIDATE $? "your mysql password setup was :"

echo "MYSQL process going Good....."