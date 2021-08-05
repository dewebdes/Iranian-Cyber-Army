def inshand():
	global conn
	global gcu
	global sqidx
	global insqls
	while True:
		if (sqidx < len(insqls)):
			gcu = conn.cursor()
			#print('\n\n' + insqls[sqidx] + '\n\n')
			gcu.execute(insqls[sqidx])
			sqidx = sqidx + 1
			conn.commit()
			gcu.close()
			#print('inser ' + str(sqidx) + ' done ok')
		time.sleep(1)

def insertlay(ln):
	global insqls
	dt = str(getnow())
	qur = "INSERT INTO layers (namefull,clsname,finddt) VALUES(" + "'" + ln + "'" + "," + "''" + "," + "'" + dt + "');"
	insqls.append(qur)

def insertpacket(pkt,lays,indx):
	global insqls
	dt = str(getnow())
	pktb64 = base64.b64encode(bytes(pkt))
	pkstr = pktb64.decode('ascii')
	ip_layer = pkt.getlayer(IP)
	Ether_layer = pkt.getlayer(Ether)
	jonlays = ",".join(lays)
	qur = "INSERT INTO packets (idx,hexraw,leyars,dt,admflags,src,dst,idnum) VALUES('" + str(indx) + "','" + pkstr + "','" + jonlays + "','" + dt + "','','" + ip_layer.src + "','" + ip_layer.dst + "','" + str(Ether_layer.id) + "');"
	insqls.append(qur)
	for ln in lays:
		if (ln == 'Ethernet'):
			#['dst', 'src', 'type']
			p_layer = pkt.getlayer('Ethernet')
			qur = "INSERT INTO ethrs (pktid,dst,src,type) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.dst) + "','" + cleandata1(p_layer.src) + "','" + cleandata1(p_layer.type) + "');"
			insqls.append(qur)
		if (ln == 'IP'):
			#['version', 'ihl', 'tos', 'len', 'id', 'flags', 'frag', 'ttl', 'proto', 'chksum', 'src', 'dst', 'options']
			p_layer = pkt.getlayer('IP')
			qur = "INSERT INTO ips (pktid,version,ihl,tos,len,fid,flags,frag,ttl,proto,chksum,src,dst,options) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.version) + "','" + cleandata1(p_layer.ihl) + "','" + cleandata1(p_layer.tos) + "','" + cleandata1(p_layer.len) + "','" + cleandata1(p_layer.id) + "','" + cleandata1(p_layer.flags) + "','" + cleandata1(p_layer.frag) + "','" + cleandata1(p_layer.ttl) + "','" + cleandata1(p_layer.proto) + "','" + cleandata1(p_layer.chksum) + "','" + cleandata1(p_layer.src) + "','" + cleandata1(p_layer.dst) + "','" + cleandata1(p_layer.options) + "');"
			insqls.append(qur)