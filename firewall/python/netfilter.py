whiteips = ['server-ip-1','server-ip-2','server-ip-n','trusted-vpn-ip','truested-ip-1','truested-ip-2','truested-ip-n','truested-ip-range','truested-ip-range']
blacklist = []
with open('googlebot-ip-ranges.txt', 'r') as file:
	data = file.read()
	linesar = data.splitlines()
	for line in linesar:
		line2 = line.replace('\n','').replace('\r','').split()[0]
		whiteips.append(line2)

def blockip(dtime, ip, port, msg):
	iswhite = False
	if ip not in blacklist:
		for w in whiteips:
			iswhite = ipaddress.IPv4Address(ip) in ipaddress.IPv4Network(w)
			if iswhite == True: break
	else:
		iswhite = True
		
	if iswhite == False:
		retcode = subprocess.call(["iptables","-I", "INPUT", "-s", ip, "-j", "DROP"])
		blacklist.append(ip)
		qur = "INSERT INTO attacks (msg,remoteip,remoteport,flags,dtime) VALUES('" + cleandata1(msg) + "','" + cleandata1(ip) + "','" + cleandata1(port) + "','','" + cleandata1(dtime) + "');"
		insqls.append(qur)
		print('ATTACK; ' + dtime + ' ==> ' + ip + ' : ' + port + ' < ' + msg)

