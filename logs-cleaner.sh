#!/bin/bash

user="user"
log_dir1="/var/www/html"
main_log="/home/user/app-path/current/log/"

for i in  $prod $sync_ $sync_2 $sync__3 $sidekiq $staging $analytics
do
ip=$(echo $i | cut -d "=" -f1)
name=$(echo $i |cut -d "=" -f2)
echo "@{$name}@"
echo "############"
echo ""
ssh -t $user@$ip "if [ -d "$main_log" ];then cd "$main_log" && sudo  find "$main_log" -mtime +5 -exec rm -rf  {} \;;else echo not found;  fi;"
echo "############################################################ "
echo
echo
done
