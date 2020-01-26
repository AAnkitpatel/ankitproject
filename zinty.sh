#!/bin/sh
for host in $(cat host)
do
	ssh -t $host "echo 'hello system is going to down' | wall  "
ssh -t $host<< EOF 
apt install zenity -y > /dev/null 2>&1
zenity --info --title= 'Alert by server team' --text='The timer is over ...!'
EOF
done
#for host in $(cat host)
#do
#	ssh $host "sudo apt-get install zenity -y >  /dev/null  2>&1"
#	if [ "$?" = "0" ]; then
#	echo ;
#else
#	echo failed;
#fi
#done
