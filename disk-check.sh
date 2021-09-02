for i in $(cat server-info)
do
	ip=$(echo $i | cut -d "=" -f1)
	name=$(echo $i | cut -d "=" -f2)
	output=$(ssh -l user $ip -C '/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /  && df -h /')
	log=$(ssh -l user $ip -C ' du -sh /home/user/app-rails/current/log/; du -sh /var/log 2>/dev/null')
	#echo "$ip = $name"
	echo  "\n$name===>\n $output" 
	echo "\n $log"
done

