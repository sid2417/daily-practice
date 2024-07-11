#!/bin/bash/
#Threshold limit 15%
#disk usage column
#disc usage folder name
#disk usage column -ge 15 ---> we need to remove data
#(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)

THRESHOLD_LIMIT=15
DISC_USAGE_LIST=$(df -hT | grep xfs )
MESSAGE=""

while IFS= read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $THRESHOLD_LIMIT ]
    then 
        #echo "$FOLDER is more than $THRESHOLD_LIMIT, the current usage of the  $FOLDER is : $USAGE"
        #MESSAGE="$FOLDER is more than $THRESHOLD_LIMIT, the current usage of the  $FOLDER is : $USAGE"
        MESSAGE+="$FOLDER is more than $THRESHOLD_LIMIT, the current usage of the  $FOLDER is : $USAGE \n"

    fi

done <<< $DISC_USAGE_LIST

# echo "message : $MESSAGE"

echo -e "message : $MESSAGE"      # to print a special charaters you mention (-e) for new line, just like enable

#echo "This is a test mail & Date $(date)" | mail -s "message" siddhu1smore@gmail.com
#echo "Body" | mail -s "Subject" To Address

echo "$MESSAGE" | mail -s "DISC USAGE ALERT" siddhu1smore@gmail.com