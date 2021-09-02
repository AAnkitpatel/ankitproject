#!/bin/bash




runtime="1440 minute"
endtime=$(date -ud "$runtime" +%s)
#[[ $(date -u +%s) -le $endtime ]]
main() {
while true
do
    echo "Time Now: `date +%D:+%H:%M:%S`"
    #output=$(nc -v -z -w 3 34.212.50.161 22 &> /dev/null && echo "Online" || echo "Offline")
    for i in $sync $sync2 $sync3 $default_sidekiq $sync_inventory_1 $sync_inventory $api_deploy $api_2_deploy $api_3_deploy $broadcast_to_yard $broadcast_to_yard_1 $broadcast_to_yard_2 $broadcast_to_yard_3 $cron_server_deploy $product_create_update $regenerate_cache $sidekiq 
    do
    ip=$(echo $i | cut -d "=" -f1)
    instance_id=$(echo $i | cut -d "=" -f2)
    name=$(echo $i |cut -d "=" -f3)
    echo "$ip >>> $instance_id"
#    sleep 5m
    echo "Time Now: `date +%D:+%H:%M:%S`"
    timeout 20 ssh user@$ip "uname -a" > /dev/null 2>&1  
    if [ "$?" == "0"  ]
    then
	    echo -e "$name >>$ip is fine\n"
    else
	    #echo "$name aws ec2 reboot-instances --instance-ids $instance_id"
	    sudo aws ec2 reboot-instances --instance-ids $instance_id --profile shell
	if [ "$?" == "0" ]
	then
	echo -e "$name>>$ip instances is restart\n"
	fi
    fi
    
#sleep 2
done    
echo "wait 10min"
sleep 10m
done
}
main #>> /var/log/ssh-checker.log &
