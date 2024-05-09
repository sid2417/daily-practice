#!/bin/bash/
#Threshold limit 15%
#disk usage column
#disc usage folder name
#disk usage column -ge 15 ---> we need to remove data

THRESHOLD_LIMIT=15
DISC_USAGE_LIST=$(df -hT | grep xfs )

while IFS= read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $THRESHOLD_LIMIT ]
    then 
        #echo your $DISC_USAGE_LIST is more than $THRESHOLD_LIMIT, from folder Name :  $FOLDER
        echo "$FOLDER is more than $THRESHOLD_LIMIT, the current usage of the  $FOLDER is : $USAGE"
    fi

done <<< $DISC_USAGE_LIST




#(df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)