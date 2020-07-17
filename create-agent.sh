#!bin/bash
url='https://docs.google.com/spreadsheets/d/e/2PACX-1vQ8nQh1ujg-x6uuR9onW2zhaDz7e-dSJMuFd3MbWCEdRfgD7QUyTr5Wfl-JLSISN6pmAtfgGXNDg_W-/pub?gid=994542265&single=true&output=csv'
wget --no-check-certificate -q -O - $url > id
echo "file updating ..."
count=$(cat id | wc -w)
echo "total system $count for update" 
for id in $(cat id)
do
       
    id0=$(echo $id | cut -d ',' -f1 | cut -b6,7,8 )
    id1=$(echo $id | cut -d "," -f1)
    ip1=$(wget -cq http://andromobi.com/system_json.php -O - | jq '.' | grep $id1 | cut -d '"' -f 4)
    echo $id1  $id0  $ip1
    echo -e "----------------------------------------------------- [running on]\r   $id1  $id0 $ip1  "
    
    ssh-keyscan -H $ip1 >> ~/.ssh/known_hosts
    printf "#===================================================================#"
    echo " "

    ssh $ip1 "sh /home/ubuntu/work/multi/imp/createagent.sh $id0 && sh /home/ubuntu/work/multi/imp/update.sh"
    echo "###################################################################################################"
    echo -e "------------------------------------------------------ [updated]\r $id1 $ip1 "


sleep 1
done
