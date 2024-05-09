#!/bin/bash/

#color #rootuser #logfile # timestamp 
set -e
source ./comman.sh

echo "Please Enter your DB password : "
read DB_PASSWORD 



dnf install mysqllll-server -y &>>$LOGFILE
systemctl enable mysqld &>>$LOGFILE
systemctl start mysqlddd &>>$LOGFILE
mysql -h db.happywithyogamoney.fun -uroot -p${DB_PASSWORD} -e 'SHOW DATABASES;'
if [ $? -ne 0 ]
then 
    mysql_secure_installation --set-root-pass -p${DB_PASSWORD} &>>$LOGFILE
else
    echo "Your password is already Setup.. Thankyou"
fi


echo -e "$Y MYSQL process going Good.....$N"