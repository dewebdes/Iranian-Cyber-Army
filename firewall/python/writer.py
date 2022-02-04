def inshand():
	global conn
	global gcu
	global sqidx
	global insqls
	while True:
		if (sqidx < len(insqls)):
			gcu = conn.cursor()
			#print('\n\n' + insqls[sqidx] + '\n\n')
			try:
				gcu.execute(insqls[sqidx])
				sqidx = sqidx + 1
				conn.commit()
				gcu.close()
			except conn.Error as err:
				print('insert-ERROR :: ' + str(sqidx) + " - " + insqls[sqidx])
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
		if (ln == 'HTTPRequest'):
			print('request...')
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
		if (ln == 'TCP'):
			#['sport', 'dport', 'seq', 'ack', 'dataofs', 'reserved', 'flags', 'window', 'chksum', 'urgptr', 'options']
			p_layer = pkt.getlayer('TCP')
			qur = "INSERT INTO tcps (pktid,sport,dport,seq,ack,dataofs,reserved,flags,windowv,chksum,urgptr,options) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.sport) + "','" + cleandata1(p_layer.dport) + "','" + cleandata1(p_layer.seq) + "','" + cleandata1(p_layer.ack) + "','" + cleandata1(p_layer.dataofs) + "','" + cleandata1(p_layer.reserved) + "','" + cleandata1(p_layer.flags) + "','" + cleandata1(p_layer.window) + "','" + cleandata1(p_layer.chksum) + "','" + cleandata1(p_layer.urgptr) + "','" + cleandata1(p_layer.options) + "');"
			insqls.append(qur)
			#print(binascii.hexlify(bytes(pkt[TCP].payload)).decode("utf-8"))
		if (ln == 'Padding'):
			#['load']
			p_layer = pkt.getlayer('Padding')
			qur = "INSERT INTO paddings (pktid,loadv) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.load) + "');"
			insqls.append(qur)
		if (ln == 'UDP'):
			#['sport', 'dport', 'len', 'chksum']
			p_layer = pkt.getlayer('UDP')
			qur = "INSERT INTO udps (pktid,sport,dport,len,chksum) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.sport) + "','" + cleandata1(p_layer.dport) + "','" + cleandata1(p_layer.len) + "','" + cleandata1(p_layer.chksum) + "');"
			insqls.append(qur)
		if (ln == 'Raw'):
			#['load']
			p_layer = pkt.getlayer('Raw')
			qur = "INSERT INTO raws (pktid,loadv) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.load) + "');"
			insqls.append(qur)
			
		if (ln == 'NTPHeader'):
			#['leap', 'version', 'mode', 'stratum', 'poll', 'precision', 'delay', 'dispersion', 'id', 'ref_id', 'ref', 'orig', 'recv', 'sent']
			p_layer = pkt.getlayer('NTPHeader')
			qur = "INSERT INTO ntpheaders (pktid,leap,version,mode,stratum,poll,precisionv,delay,dispersion,idv,ref_id,ref,orig,recv,sent) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.leap) + "','" + cleandata1(p_layer.version) + "','" + cleandata1(p_layer.mode) + "','" + cleandata1(p_layer.stratum) + "','" + cleandata1(p_layer.poll) + "','" + cleandata1(p_layer.precision) + "','" + cleandata1(p_layer.delay) + "','" + cleandata1(p_layer.dispersion) + "','" + cleandata1(p_layer.id) + "','" + cleandata1(p_layer.ref_id) + "','" + cleandata1(p_layer.ref) + "','" + cleandata1(p_layer.orig) + "','" + cleandata1(p_layer.recv) + "','" + cleandata1(p_layer.sent) + "');"
			insqls.append(qur)
		if (ln == 'BOOTP'):
			#['op', 'htype', 'hlen', 'hops', 'xid', 'secs', 'flags', 'ciaddr', 'yiaddr', 'siaddr', 'giaddr', 'chaddr', 'sname', 'file', 'options']
			p_layer = pkt.getlayer('BOOTP')
			qur = "INSERT INTO bootps (pktid,op,htype,hlen,hops,xid,secs,flags,ciaddr,yiaddr, siaddr,giaddr,chaddr,sname,file,options) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.op) + "','" + cleandata1(p_layer.htype) + "','" + cleandata1(p_layer.hlen) + "','" + cleandata1(p_layer.hops) + "','" + cleandata1(p_layer.xid) + "','" + cleandata1(p_layer.secs) + "','" + cleandata1(p_layer.flags) + "','" + cleandata1(p_layer.ciaddr) + "','" + cleandata1(p_layer.yiaddr) + "','" + cleandata1(p_layer.siaddr) + "','" + cleandata1(p_layer.giaddr) + "','" + cleandata1(p_layer.chaddr) + "','" + cleandata1(p_layer.sname) + "','" + cleandata1(p_layer.file) + "','" + cleandata1(p_layer.options) + "');"
			insqls.append(qur)
		if (ln == 'DHCP options'):
			#['options']
			p_layer = pkt.getlayer('DHCP')
			qur = "INSERT INTO dhcps (pktid,options) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.options) + "');"
			insqls.append(qur)
		if (ln == 'IP Option Router Alert'):
			#['copy_flag', 'optclass', 'option', 'length', 'alert']
			p_layer = pkt.getlayer('IPOption_Router_Alert')
			qur = "INSERT INTO ipoptionrouteralerts (pktid,copy_flag,optclass,optionv,length,alert) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.copy_flag) + "','" + cleandata1(p_layer.optclass) + "','" + cleandata1(p_layer.option) + "','" + cleandata1(p_layer.length) + "','" + cleandata1(p_layer.alert) + "');"
			insqls.append(qur)
		if (ln == 'DNS'):
			#['length', 'id', 'qr', 'opcode', 'aa', 'tc', 'rd', 'ra', 'z', 'ad', 'cd', 'rcode', 'qdcount', 'ancount', 'nscount', 'arcount', 'qd', 'an', 'ns', 'ar']
			p_layer = pkt.getlayer('DNS')
			qur = "INSERT INTO dnss (pktid,length,idv,qr,opcode,aa,tc,rd,ra,z,ad,cd,rcode,qdcount,ancount,nscount,arcount,qd,an,ns,ar) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.length) + "','" + cleandata1(p_layer.id) + "','" + cleandata1(p_layer.qr) + "','" + cleandata1(p_layer.opcode) + "','" + cleandata1(p_layer.aa) + "','" + cleandata1(p_layer.tc) + "','" + cleandata1(p_layer.rd) + "','" + cleandata1(p_layer.ra) + "','" + cleandata1(p_layer.z) + "','" + cleandata1(p_layer.ad) + "','" + cleandata1(p_layer.cd) + "','" + cleandata1(p_layer.rcode) + "','" + cleandata1(p_layer.qdcount) + "','" + cleandata1(p_layer.ancount) + "','" + cleandata1(p_layer.nscount) + "','" + cleandata1(p_layer.arcount) + "','" + cleandata1(p_layer.qd) + "','" + cleandata1(p_layer.an) + "','" + cleandata1(p_layer.ns) + "','" + cleandata1(p_layer.ar) + "');"
			insqls.append(qur)
		if (ln == 'DNS Question Record'):
			#['qname', 'qtype', 'qclass']
			p_layer = pkt.getlayer('DNSQR')
			qur = "INSERT INTO dnsqr (pktid,qname,qtype,qclass) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.qname) + "','" + cleandata1(p_layer.qtype) + "','" + cleandata1(p_layer.qclass) + "');"
			insqls.append(qur)
		if (ln == 'Link Local Multicast Node Resolution - Query'):
			#['id', 'qr', 'opcode', 'c', 'tc', 'z', 'rcode', 'qdcount', 'ancount', 'nscount', 'arcount', 'qd', 'an', 'ns', 'ar']
			p_layer = pkt.getlayer('LLMNRQuery')
			qur = "INSERT INTO llmnquery (pktid,idv,qr,opcode,c,tc,z,rcode,qdcount,ancount,nscount,arcount,qd,an,ns,ar) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.id) + "','" + cleandata1(p_layer.qr) + "','" + cleandata1(p_layer.opcode) + "','" + cleandata1(p_layer.c) + "','" + cleandata1(p_layer.tc) + "','" + cleandata1(p_layer.z) + "','" + cleandata1(p_layer.rcode) + "','" + cleandata1(p_layer.qdcount) + "','" + cleandata1(p_layer.ancount) + "','" + cleandata1(p_layer.nscount) + "','" + cleandata1(p_layer.arcount) + "','" + cleandata1(p_layer.qd) + "','" + cleandata1(p_layer.an) + "','" + cleandata1(p_layer.ns) + "','" + cleandata1(p_layer.ar) + "');"
			insqls.append(qur)
		if (ln == 'DNS Resource Record'):
			#['rrname', 'type', 'rclass', 'ttl', 'rdlen', 'rdata']
			p_layer = pkt.getlayer('DNSRR')
			qur = "INSERT INTO dnsrrs (pktid,rrname,type,rclass,ttl,rdlen,rdata) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.rrname) + "','" + cleandata1(p_layer.type) + "','" + cleandata1(p_layer.rclass) + "','" + cleandata1(p_layer.ttl) + "','" + cleandata1(p_layer.rdlen) + "','" + cleandata1(p_layer.rdata) + "');"
			insqls.append(qur)
		if (ln == 'DNS OPT Resource Record'):
			#['rrname', 'type', 'rclass', 'extrcode', 'version', 'z', 'rdlen', 'rdata']
			p_layer = pkt.getlayer('DNSRROPT')
			qur = "INSERT INTO dnsropts (pktid,rrname,type,rclass,extrcode,version,z,rdlen,rdata) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.rrname) + "','" + cleandata1(p_layer.type) + "','" + cleandata1(p_layer.rclass) + "','" + cleandata1(p_layer.extrcode) + "','" + cleandata1(p_layer.version) + "','" + cleandata1(p_layer.z) + "','" + cleandata1(p_layer.rdlen) + "','" + cleandata1(p_layer.rdata) + "');"
			insqls.append(qur)
		if (ln == 'DNS SOA Resource Record'):
			#['rrname', 'type', 'rclass', 'ttl', 'rdlen', 'mname', 'rname', 'serial', 'refresh', 'retry', 'expire', 'minimum']
			p_layer = pkt.getlayer('DNSRRSOA')
			qur = "INSERT INTO dnsrrsoas (pktid,rrname,type,rclass,ttl,rdlen,mname,rname,serial,refresh,retry,expire,minimum) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.rrname) + "','" + cleandata1(p_layer.type) + "','" + cleandata1(p_layer.rclass) + "','" + cleandata1(p_layer.ttl) + "','" + cleandata1(p_layer.rdlen) + "','" + cleandata1(p_layer.mname) + "','" + cleandata1(p_layer.rname) + "','" + cleandata1(p_layer.serial) + "','" + cleandata1(p_layer.refresh) + "','" + cleandata1(p_layer.retry) + "','" + cleandata1(p_layer.expire) + "','" + cleandata1(p_layer.minimum) + "');"
			insqls.append(qur)
		if (ln == 'NBNS query request'):
			#['NAME_TRN_ID', 'FLAGS', 'QDCOUNT', 'ANCOUNT', 'NSCOUNT', 'ARCOUNT', 'QUESTION_NAME', 'SUFFIX', 'NULL', 'QUESTION_TYPE', 'QUESTION_CLASS']
			p_layer = pkt.getlayer('NBNSQueryRequest')
			qur = "INSERT INTO nbnsqueryrequests (pktid,NAME_TRN_ID,FLAGS,QDCOUNT,ANCOUNT,NSCOUNT,ARCOUNT,QUESTION_NAME,SUFFIX,NULLv,QUESTION_TYPE,QUESTION_CLASS) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.NAME_TRN_ID) + "','" + cleandata1(p_layer.FLAGS) + "','" + cleandata1(p_layer.QDCOUNT) + "','" + cleandata1(p_layer.ANCOUNT) + "','" + cleandata1(p_layer.NSCOUNT) + "','" + cleandata1(p_layer.ARCOUNT) + "','" + cleandata1(p_layer.QUESTION_NAME) + "','" + cleandata1(p_layer.SUFFIX) + "','" + cleandata1(p_layer.NULL) + "','" + cleandata1(p_layer.QUESTION_TYPE) + "','" + cleandata1(p_layer.QUESTION_CLASS) + "');"
			insqls.append(qur)
		if (ln == 'DNS EDNS0 TLV'):
			#['optcode', 'optlen', 'optdata']
			p_layer = pkt.getlayer('EDNS0TLV')
			qur = "INSERT INTO edns0tlvs (pktid,optcode,optlen,optdata) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.optcode) + "','" + cleandata1(p_layer.optlen) + "','" + cleandata1(p_layer.optdata) + "');"
			insqls.append(qur)
			
		
		if (ln == 'DNS SRV Resource Record'):
			#['rrname', 'type', 'rclass', 'ttl', 'rdlen', 'priority', 'weight', 'port', 'target']
			p_layer = pkt.getlayer('DNSRRSRV')
			qur = "INSERT INTO dnsrrsrvs2 (pktid,rrname,type,rclass,ttl,rdlen,priority,weight,port,target) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.rrname) + "','" + cleandata1(p_layer.type) + "','" + cleandata1(p_layer.rclass) + "','" + cleandata1(p_layer.ttl) + "','" + cleandata1(p_layer.rdlen) + "','" + cleandata1(p_layer.priority) + "','" + cleandata1(p_layer.weight)  + "','" + cleandata1(p_layer.port) + "','" + cleandata1(p_layer.target) + "');"
			insqls.append(qur)
			
		if (ln == 'DNS NSEC Resource Record'):
			#['rrname', 'type', 'rclass', 'ttl', 'rdlen', 'nextname', 'typebitmaps']
			p_layer = pkt.getlayer('DNSRRNSEC')
			qur = "INSERT INTO dnsrrnsecs2 (pktid,rrname,type,rclass,ttl,rdlen,nextname,typebitmaps) VALUES('" + cleandata1(indx) + "','" + cleandata1(p_layer.rrname) + "','" + cleandata1(p_layer.type) + "','" + cleandata1(p_layer.rclass) + "','" + cleandata1(p_layer.ttl) + "','" + cleandata1(p_layer.rdlen) + "','" + cleandata1(p_layer.nextname) + "','" + cleandata1(p_layer.typebitmaps) + "');"
			insqls.append(qur)
			
		if (ln == 'ICMP'):
			#['type', 'code', 'chksum', 'id', 'seq', 'ts_ori', 'ts_rx', 'ts_tx', 'gw', 'ptr', 'reserved', 'length', 'addr_mask', 'nexthopmtu', 'unused']
			p_layer = pkt.getlayer('ICMP')
			
		if (ln == 'IP in ICMP'):
			#['version', 'ihl', 'tos', 'len', 'id', 'flags', 'frag', 'ttl', 'proto', 'chksum', 'src', 'dst', 'options']
			p_layer = pkt.getlayer('IPerror')
			
		if (ln == 'L2TP'):
			#
			p_layer = pkt.getlayer('L2TP')
			
		if (ln == 'PPP Link Layer'):
			#
			p_layer = pkt.getlayer('PPP')
			
		if (ln == 'PPTP'):
			#
			p_layer = pkt.getlayer('PPTP')
			
		if (ln == 'Private (mode 7)'):
			#['response', 'more', 'version', 'mode', 'auth', 'seq', 'implementation', 'request_code', 'err', 'nb_items', 'mbz', 'data_item_size', 'req_data', 'data', 'authenticator']
			p_layer = pkt.getlayer('NTPPrivate')
			
		if (ln == 'RIP entry'):
			#
			p_layer = pkt.getlayer('RIPEntry')
			
		if (ln == 'RIP header'):
			#
			p_layer = pkt.getlayer('RIP')
			
		if (ln == 'SNMP'):
			#['version', 'community', 'PDU']
			p_layer = pkt.getlayer('SNMP')
			
		if (ln == 'SNMPget'):
			#['id', 'error', 'error_index', 'varbindlist']
			p_layer = pkt.getlayer('SNMPget')
			
		if (ln == 'SNMPvarbind'):
			#['oid', 'value']
			p_layer = pkt.getlayer('SNMPvarbind')
			
		if (ln == 'UDP in ICMP'):
			#['sport', 'dport', 'len', 'chksum']
			p_layer = pkt.getlayer('UDPerror')
			

			
			
			
