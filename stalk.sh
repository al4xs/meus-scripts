#!/bin/sh


echo -n "Entre com o dominio: "
read dominio

cnpj=$(whois $dominio | grep "ownerid" | sed -e 's/\///' | sed -e 's/\-//' | cut -d ':' -f 2 | sed -e 's/\.//' | sed -e 's/\.//' | sed -e 's/   //' | sed -e 's/\.//' | sed -e 's/\.//' | sed -e 's/  //')

curl --silent -X GET https://www.receitaws.com.br/v1/cnpj/$cnpj | json_pp
