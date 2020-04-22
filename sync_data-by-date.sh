#!/bin/bash
echo "which date you want to copy datebase backup like(00_00_00)"
read date
ssh root@172.17.0.2 "mkdir -p /root/a/$date"
rsync -zarvh --progress /root/*$date* root@172.17.0.1:/root/a/$date
#scp -pr  /root/*$date* root@172.17.0.1:/root/a/$date
