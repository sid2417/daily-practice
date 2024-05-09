#!/bin/bash/

#color #rootuser #logfile # timestamp 

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"

VALIDATE()
{
    if ($? -ne 0)
    then    
        echo  "FAILURE"
        exit 1
    else    
        echo "SUCCESS"
}

USERID=$(id -u)
if [ $USERID -ne 0]
then
    echo "Please Provide user Access "
else
    echo "You already have a SUDO access"
fi

FILENAME="echo $$" | cut -d "." -f2

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=$FILENAME+$TIMESTAMP+.log

dnf install mysql -y
VALIDATE $? "your installation was :"

systemctl enable mysql
VALIDATE $? "your Enabling was :"

systemctl start mysql
VALIDATE $? "your Starting was :"

mysql-secure-installation --set-root-pass ExpenseApp@1
VALIDATE $? "your mysql password setup was :"

echo "MYSQL process going Good....."