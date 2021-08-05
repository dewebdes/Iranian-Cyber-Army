import os
import subprocess, sys, getopt
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
import socket, select

conn = pymysql.connect(
    db='trabase',
    user='user',
    passwd='pass',
    host='localhost')
gcu = conn.cursor()

def get_packet_layers(packet):
    counter = 0
    while True:
        layer = packet.getlayer(counter)
        if layer is None:
            break

        yield layer
        counter += 1

if __name__ == "__main__":   
    if(len(sys.argv) > 1):
        if(sys.argv[1] == "ln"):
            if(len(sys.argv) == 4):
                #python3 db.py ln 27 IP
                pktid = sys.argv[2]
                gcu.execute("select * from packets where idx='" + str(pktid) + "';")
                result = list(gcu.fetchall())
                print(result[0][3])
                b64pkt = result[0][2]
                b64pkt_bytes = b64pkt.encode('ascii')
                pkt_bytes = base64.b64decode(b64pkt_bytes)
                pkt = Ether(pkt_bytes)
                layn = sys.argv[3]
                p_layer = pkt.getlayer(layn)
                field_names = [field.name for field in p_layer.fields_desc]
                print(field_names)
