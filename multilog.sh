#!/bin/bash
for input in $(cat id.txt)
do
	input_id=$(echo $input)
	sys_id=${input_id:0:3}
    logid=${input_id:3:5}
    #echo $input_id $logid = $sys_id
ip=$(wget -cq http://am.andromobi.com/system_json.php -O - | jq '.' | grep "multi$sys_id" | cut -d '"' -f 4)
full1=$(wget -cq http://fuseclick.c2a.in/v2/getcampaigns?agent_id=$input_id -O - | jq '.' | tail -5 | head -1 | cut -d '.' -f 1 | cut -d '<' -f 1 | cut -d '"' -f 2)
echo "++++++++++++++++++|Source ID = $input_id|+++++++++++++++++++"
echo "++++++++++++++++++|  $full1            |+++++++++++++++++++"
echo "++++++++++++++++++|system_IP id $ip|+++++++++++++++++"
echo -e "\n"
#ssh $ip "tail -100 app/$logid.log"
done