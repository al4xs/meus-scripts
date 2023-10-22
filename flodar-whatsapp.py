#!/usr/bin/python3
import pyautogui as flood
import time
import os

#fique avontade para melhorar e modificar
os.system("exo-open --launch WebBrowser 'web.whatsapp.com'")
time.sleep(30)

while True:
	flood.write('sua mensagem aqui')
	flood.press('enter')
	time.sleep(1)
