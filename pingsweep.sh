#!/bin/bash

if [ "$1" == "" ]
then
	echo "Modo de Uso: ./pingsweep.sh 172.16.1"
else
    for host in {1..254};
    do
        ping -c1  $1.$host | grep "64 bytes" | cut -d ":" -f1 | cut -d " " -f4;
        # Mesma coisa que: ping -c1  $1.$host | grep "64 bytes" | cut -d " " -f4 | sed 's/.$//'
    done
fi
