#!/usr/bin/python
import subprocess, sys
import socket, select
from io import StringIO
import time
from datetime import datetime
import shlex
import pymysql
import base64
import re
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
import threading
from threading import Thread
from past.builtins import execfile
import ipaddress

execfile('netfilter.py') #work with iptables
execfile('db.py') #work with database

lastid = 1 #process ids
interface = "enp34s0" #find via ifconfig 
lineindx = 0 #last line index in snort fast log
serverips = ['server-ip-1','server-ip-2','server-ip-n']

def on_modified(event):
	try:
		global lineindx
		i = 0
		linesar = []
		if event.src_path == '/var/log/snort/alert_fast.txt':
			with open(event.src_path, 'r') as file:
				data = file.read()
				linesar = data.splitlines()
				i = lineindx
				while i < len(linesar):
					line = linesar[i].replace('\n','')
					tmpar = line.split()
					dtime = tmpar[0]

					tmpar = line.replace(' ','').split('}')[1].split('->')
					ip = ''
					port = ''
					ip1 = (tmpar[0]).split(':')[0]
					ip2 = (tmpar[1].split()[0]).split(':')[0]

					if ip1 not in serverips: 
						ip = ip1
						try:
							port = strip(tmpar[0]).split(':')[1]
						except:
							port = '0'
					else:
						ip = ip2
						try:
							port = strip(tmpar[1]).split(':')[1]
						except:
							port = '0'
					
					tmpar = line.split('"')
					msg = tmpar[1]

					#print(dtime + ' ==> ' + ip + ' : ' + port + ' < ' + msg)
					blockip(dtime, ip, port, msg)

					i = i + 1
				
				lineindx = len(linesar)
	except:
		print('Error-Parse-Line ==> ' + linesar[i])

class snortThread (threading.Thread):
	def __init__(self, threadID):
		threading.Thread.__init__(self)
		self.threadID = threadID
	def run(self):
		print ("Starting snort: " + str(self.threadID))
		cmd = "snort -c /usr/local/etc/snort/snort.lua -R /usr/local/etc/rules/2022A.rules -i " + interface + " -s 65535 -k none -l /var/log/snort/"
		p = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
		while True:
			out = p.stderr.read(1)
			if out == '' and p.poll() != None:
				break
			if out != '':
				x = out.decode('utf-8').split("\n")

def start_snort():
	global lastid
	lastid = lastid + 1
	snrt = snortThread(lastid)
	snrt.start()


if __name__ == '__main__':
	open("/var/log/snort/alert_fast.txt", "w").close() #clean snort fast log file
	
	Thread(target = start_snort).start() #start snort thread
	Thread(target = inshand).start() #start db handler

	#watchdog definitions for check alert_fast.txt snort log file
	patterns = "*"
	ignore_patterns = ""
	ignore_directories = False
	case_sensitive = True
	my_event_handler = PatternMatchingEventHandler(patterns, ignore_patterns, ignore_directories, case_sensitive)
	my_event_handler.on_modified = on_modified
	path = "/var/log/snort"
	go_recursively = True
	my_observer = Observer()
	my_observer.schedule(my_event_handler, path, recursive=go_recursively)
	my_observer.start()
	try:
		while True:
			time.sleep(1)
	except KeyboardInterrupt:
		my_observer.stop()
		my_observer.join()
