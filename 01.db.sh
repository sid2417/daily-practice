#!/bin/bash/

#color #rootuser #logfile # timestamp 

#source ./comman.sh

echo "Please Enter your DB password : "
read DB_PASSWORD 

dnf install mysql-server -y &>>LOGFILE
VALIDATE $? "your installation was :"

systemctl enable mysqld &>>LOGFILE
VALIDATE $? "your Enabling was :"

systemctl start mysqld &>>LOGFILE
VALIDATE $? "your Starting was :"

mysql -h db.happywithyogamoney.fun -uroot -p${DB_PASSWORD} -e 'SHOW DATABASES;'
if [ $? -ne 0 ]
then 
    mysql_secure_installation --set-root-pass -p${DB_PASSWORD} &>>LOGFILE
else
    echo "Your password is already Setup.. Thankyou"
fi
VALIDATE $? "your mysql password setup was :"

echo -e "$Y MYSQL process going Good.....$N"