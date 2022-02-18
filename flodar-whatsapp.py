#!/usr/bin/python3
import pyautogui as flood
import time
import os

#criado por @michaelklaan
#fique avontade para melhorar e modificar
os.system("exo-open --launch WebBrowser 'web.whatsapp.com'")
time.sleep(30)

while true:
	flood.write('sua mensagem aqui')
	fload.press('enter')
	time.sleep(1)
