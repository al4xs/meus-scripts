#!/bin/bash
# Descrição: Envie SMS em anonymo

# Cores

# Reset
NC='\033[0m'       # Text Reset

BLINK=$(tput blink)

Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green

toilet -f pagga -F border AL4XS | lolcat


function bye() {
	echo -e "$Green Feito... $NC"
	sleep 1
	echo -e "$Green Fechando SMS  $NC"
	sleep 1
	echo " "
	echo -e "$BGreen Bye $NC"
	echo " "
	exit
}

	echo " "
	echo -e "$Red      Use o código do brasil + DDD + numero de telefone "
	echo -e "$Yellow      Exemplo de código do brasil = $Blue 55 $Green seguido do número de telefone = $Blue 5566778899"
	echo -e "$Yellow      Entre em um número desta forma > $Blue 915566778899"
	echo "  "
	echo "  "

	echo -e "$Green     Por favor digite o número de telefone completo abaixo:  $NC"
	read PHONE
	echo "  "
	echo -e "$Green Digite o SMS que deseja enviar: $NC"
	read SMS

resultado=$(curl -X POST https://textbelt.com/text --data-urlencode phone="$PHONE" --data-urlencode message="$SMS" -d key=textbelt)
if $resultado == "true"
then
	echo "  "
	echo -e "$BGreen SUCCESSO $NC"
	echo "  "
	echo -e "$BGreen ---------------------------------------------- $NC"
	echo "  "
	printf "$resultado"
	bye
else
	echo "  "
	echo -e "$BRed SMS NÃO ENVIADO, TENTE NOVAMENTE $NC"
	echo "  "
	echo -e "$BGreen ---------------------------------------------- $NC"
	printf "$resultado"
	echo " "
	bye
fi
