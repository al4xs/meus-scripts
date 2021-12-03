#!/bin/bash

fechacor='\033[0m'       # Text Reset

vermelho='\033[0;31m'          # Red
verde='\033[0;32m'        # Green
amarelo='\033[0;33m'       # Yellow
azul='\033[0;34m'         # Blue
roxo='\033[0;35m'       # Purple
vermelhonegrito='\033[1;31m'         # Red
verdenegrito='\033[1;32m'       # Green

echo "qual o dominio?"
read url
if [ "$url" == "" ]
then
	echo -e "$vermelhonegrito Por favor tente novamente e insira o dominio $fechacor"

else
	echo -e " "
	echo -e " "
	echo -e "$azul REALIZANDO SCAN EM: $url ... $fechacor"
	echo -e "$amarelo POR FAVOR AGUARDE... $fechacor"
	wget $url 2>/dev/null
	sleep 1
	echo -e " "
	echo -e " "
	echo -e "$vermelhonegrito####################################$fechacor"
	echo -e "$vermelhonegrito# DOMINIOS ENCONTRADOS $fechacor"
	echo -e "$vermelhonegrito####################################$fechacor"
	cat index.html | grep "href" | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" | grep -v "a>" | sort -u | tee dominios.txt
	sleep 1
	echo -e " "
	echo -e " "
	echo -e "$verdenegrito########################################$fechacor"
	echo -e "$verdenegrito#   DOMINIO    |   IP          $fechacor"
	echo -e "$verdenegrito########################################$fechacor"
	sleep 1
	for dominios in $(cat dominios.txt);do host $dominios | sed -e "s/has address//"; done
	rm -rf dominios.txt index.html*
fi
