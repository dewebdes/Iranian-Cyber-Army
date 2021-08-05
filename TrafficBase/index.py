import os
from http.server import BaseHTTPRequestHandler, HTTPServer
import ssl
import subprocess, sys
from scapy.all import *
from io import StringIO
from scapy.layers import inet
import threading
import time
import shlex
import cgitb
cgitb.enable()
import pymysql
from datetime import datetime
import base64
import re
from urllib.request import urlopen
import requests
import socket, select
from past.builtins import execfile


execfile('Defense/defence.py')
execfile('Writer/writer.py')
execfile('Reader/reader.py')

interface = "ens33" #interface name for capture
hostName = "0.0.0.0" #https server ip for honeypot
serverPort = 21 #https server port for honeypot
mycertfile = ".../ssl-bundle.crt" #honeypot server ssl cert 
mykeyfile = ".../private.key" #honeypot server ssl key 
whitelist = "" #ip commo seprate for no blocking
lastid = 0 #thread id counter for packet handlenig
culays = []
insqls = []
sqidx = 0
pidx = 0

conn = pymysql.connect(
    db='trabase',
    user='user',
    passwd='pass',
    host='localhost')
gcu = conn.cursor()

def getnow():
	now = datetime.now()
	tk = now.strftime("%m/%d/%Y-%H:%M:%S")
	return tk

def cleandata1(d):
	d2 = str(d)
	d2 = d2.replace(",", "")
	d2 = d2.replace("'", "")
	d2 = d2.replace("\"", "")
	return d2

class TCPacks(object):
	def __init__(self, ip, mac):
		self.ip = ip
		self.mac = mac

class packThread (threading.Thread):
   def __init__(self, threadID, pack, layer):
      threading.Thread.__init__(self)
      self.threadID = threadID
      self.pack = pack
      self.layer = layer
   def run(self):
      print_packet(self.pack)

def handle_packet(packet):
	global lastid
	lastid = lastid + 1
	pt = packThread(lastid, packet, IP)
	pt.start()

def get_packet_layers(packet):
    counter = 0
    while True:
        layer = packet.getlayer(counter)
        if layer is None:
            break

        yield layer
        counter += 1

def print_packet(packet):
	laylist = get_packet_layers(packet)
	players = []
	global culays
	global pidx

	for layer in laylist:
		islayin = False
		for i in culays:
			if (i[0] == layer.name):
				islayin = True
				break
		if (islayin == False):
			insertlay(layer.name)
			culays.append([layer.name,''])
		players.append(layer.name)

	pidx = pidx + 1
	insertpacket(packet,players,pidx)
	


def start_scap():
	sniff(iface=interface, filter="ip", prn=handle_packet)

def blockip(dip):
	global whitelist
	try:
		if layer.name not in whitelist:
			retcode = subprocess.call(["iptables","-A", "INPUT", "-s", dip, "-j", "DROP"])
			retcode = subprocess.call(["netfilter-persistent", "save"])
			retcode = subprocess.call(["netfilter-persistent", "reload"])
			attack2ip(dip)
	except:
		retcode = 0

class MyServer(BaseHTTPRequestHandler):
	def do_GET(self):
		res = ""
		rescont = 0
		cip = self.client_address[0]
		blockip(cip)
		self.send_response(200)
		self.send_header("Content-type", "text/html")
		self.end_headers()
		self.wfile.write(bytes("<html><head><title>Admin Panel</title></head>", "utf-8"))
		self.wfile.write(bytes("<body>", "utf-8"))
		self.wfile.write(bytes("<p>username or password not found</p>", "utf-8"))
		self.wfile.write(bytes("</body></html>", "utf-8"))

if __name__ == "__main__":   
	Thread(target = inshand).start()
	culays = readlayers()
	lastidxlist = getlidx()
	if (len(lastidxlist) > 0):
		pidx = int(lastidxlist[0][0])
	Thread(target = start_scap).start()
	server_address = ('localhost', serverPort)
	httpd = HTTPServer((hostName, serverPort), MyServer)
	httpd.socket = ssl.wrap_socket(httpd.socket,server_side=True,certfile=mycertfile,keyfile=mykeyfile,ssl_version=ssl.PROTOCOL_TLS)
	print("Honeypot Server started https://%s:%s" % (hostName, serverPort))
	try:
		httpd.serve_forever()
	except KeyboardInterrupt:
		pass
	httpd.server_close()
	print("Server stopped.")