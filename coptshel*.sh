#!/bin/bash
url=http://fuseclick.c2a.in/v2/getcampaigns?agent_id
cmd=curl
f=grep
argu="package_names":
for i in $(cat id)
do   
    CURL=$(curl -s  -L $url=$i)
    out=$(echo $CURL | cut -d '[' -f 5 | tail -1 | cut -d '<' -f 1 | cut -d '"' -f 2)
    echo $out
done
for f in $(cat file)
do 
    echo $f
done