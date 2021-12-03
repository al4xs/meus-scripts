#!/bin/bash

for ip in $(cat listadeip.txt);
do
echo "$ip";
curl -X GET http://ip-api.com/json/$ip --silent | cut -d '"' -f 8,20,24,44,40 | sed 's/"/ /' | sed 's/"/ /' | sed 's/"/ /' | sed 's/"/ /' | sed 's/ org/ /';
done
