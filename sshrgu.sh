#!/bin/sh
echo "enter the client ip"

read ip
ssh-keyscan -H $ip >> ~/.ssh/known_hosts
ssh root@$ip 
