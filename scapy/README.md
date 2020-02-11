<h1>Relax Log PACKETs</h1>
<h2>python <a href="https://github.com/dewebdes/Iranian-Cyber-Army/blob/master/scapy/relaxlog.py">relaxlog.py</a></h2>
<pre>
import os
import socket
from scapy.all import *
from pprint import pprint
from scapy.layers.inet import IP
from scapy.arch import pcapdnet
i = 1
while 1>0:
	ETH_P_ALL=0x0003
	s=socket.socket(socket.AF_PACKET, socket.SOCK_RAW, socket.htons(ETH_P_ALL))
	s.bind(('lo', 0)) 
	for n in range(10):
		packets = (s.recv(2048))
		new_packet = Packet(_pkt=packets)
		print("001::$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

		new_packet.show(indent=3, lvl='', label_lvl='')
		print("002:$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
		new_packet.show()
		print("003:$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
</pre>
