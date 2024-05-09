#!/bin/bash/

#color #rootuser #logfile # timestamp 

echo "Please Enter your DB password : "
read DB_PASSWORD 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


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


FILENAME=$(echo "$0" | cut -d "." -f2)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE=/tmp/$FILENAME/$TIMESTAMP.log

dnf install mysql-server -y &>>LOGFILE
VALIDATE $? "your installation was :"

systemctl enable mysqld &>>LOGFILE
VALIDATE $? "your Enabling was :"

systemctl start mysqld &>LOGFILE
VALIDATE $? "your Starting was :"

mysql_secure_installation --set-root-pass -p${DB_PASSWORD} &>>LOGFILE
VALIDATE $? "your mysql password setup was :"

echo -e "$Y MYSQL process going Good.....$N"