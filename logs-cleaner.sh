#!/bin/bash
sync_apfusion="44.227.24.74=sync-apfusion"
staging="35.162.154.176=staging"       
APF_prod="35.167.65.242=APF-prod"       
sidekiq="44.233.192.168=sidekiq"       
apfusion_analytics="35.167.146.144=apfusion-analytics"       
sync_apfusion_2="34.215.103.235=sync-apfusion_2"    
sync_apfusion_3="34.212.50.161=sync-apfusion_3"    

user="w3villa"
log_dir1="/var/www/html"
main_log="/home/w3villa/apfusion-rails/current/log/"

for i in  $APF_prod $sync_apfusion $sync_apfusion_2 $sync_apfusion_3 $sidekiq $staging $apfusion_analytics
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
