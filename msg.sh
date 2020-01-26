#!/bin/sh
#Make sure you have host file..
for host in $(cat host)
do
	ssh $host "echo 'hello system is going to down' | wall  "

done
