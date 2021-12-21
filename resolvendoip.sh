#!/bin/bash

for ip in $(cat ips.txt);
do
echo -n "$ip ";
curl -X GET http://ip-api.com/json/$ip --silent | cut -d '"' -f 8,20,24,44,40 | sed 's/"/ /' | sed 's/"/ /' | sed 's/"/ /' | sed 's/"/ /' | sed 's/ org/ /'; sleep 1;
done
