#!/bin/sh
#Please replace the values like myuser and backup path in accordance with that of DB server before deploying
#script assumes mail exchange server, gzip and mysql db server are installed


now="$(date +'%d_%m_%Y_%H_%M_%S')"
filename="db_backup_$now".gz
backupfolder="/home/centos/mysqldailydump/"                             #(Please give a predefined back up directory here, put the full path)
fullpathbackupfile="$backupfolder/$filename"
logfile="$backupfolder/"backup_log_"$(date +'%Y_%m')".txt
echo "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
mysqldump --user=username --password=12341234 --host=00.00.00.00 dbname | gzip > "$fullpathbackupfile"
echo "mysqldump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"

# To check dump file exist or not with
#file="$backupfolder/$filename"                         (Uncomment to check notification mails)
#actualsize=$(wc -c <"$file")                           (conditional check to send the size of file > 0 and shoot a mail)
#if [ -f "$file" && $actualsize -ge 0]
#then
#       echo "$file found."
        # Code to send mail in success scenario
#    echo -e "MySql dump successful" | mail -s "Dump success" emailID1,emailID2
#else
#       echo "$file not found."
#       # Code to send mail in failure scenario
#       echo -e "MySql dump failed" | mail -s "Dump fail" emailID1,emailID2
#fi


#chown user "$fullpathbackupfile"                      #(please change the user here in accordance with server user)
#chown user "$logfile"
#echo "file permission changed" >> "$logfile"
#find "$backupfolder" -name 'db_backup_*' -mtime +2 -exec rm {} \;
#echo "old files deleted" >> "$logfile"
#echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
#echo "*****************" >> "$logfile"
exit 0
