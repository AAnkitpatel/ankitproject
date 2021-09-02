main (){
while true
do
	status=$(systemctl status apache2 | grep running &> /dev/null && echo "Online" || echo "Offline")
	if [ "$status" == "Online" ]
	then
	echo 'sidekiq is running'
else
	systemctl --user restart sidekiq > /dev/null 2&>1
	if [ "$?" == "0" ]
	then
	echo 'servie sidekiq restart done'
	else 
	echo "somthing happening wrong"
	fi	
	echo 'sidekiq stoped'
fi
sleep 5
done
}
main >> log &

