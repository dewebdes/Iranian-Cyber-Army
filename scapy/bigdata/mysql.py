#!/usr/bin/python
import cgitb
cgitb.enable()
import pymysql
conn = pymysql.connect(
    db='',
    user='',
    passwd='',
    host='localhost')
c = conn.cursor()
c.execute("INSERT INTO wp_scapy (sid,ownerTbl,ownerRec,isSingle,isExist,isNew,Raw_load,TCP_options,TCP_urgptr,TCP_chksum,TCP_window,TCP_flags,TCP_reserved,TCP_dataofs,TCP_ack,TCP_seq,TCP_dport,TCP_sport,IP_options,IP_dst,IP_src,IP_chksum,IP_proto,IP_ttl,IP_frag,IP_flags,IP_id,IP_len,IP_tos,IP_ihl,IP_version,Ethernet_type,Ethernet_src,Ethernet_dst) VALUES ("+"'0'"+","+"'0'"+","+"'0'"+","+"'0'"+","+"'0'"+","+"'0'"+","+"'Raw_load'"+","+"'TCP_options'"+","+"'TCP_urgptr'"+","+"'TCP_chksum'"+","+"'TCP_window'"+","+"'TCP_flags'"+","+"'TCP_reserved'"+","+"'TCP_dataofs'"+","+"'TCP_ack'"+","+"'TCP_seq'"+","+"'TCP_dport'"+","+"'TCP_sport'"+","+"'IP_options'"+","+"'IP_dst'"+","+"'IP_src'"+","+"'IP_chksum'"+","+"'IP_proto'"+","+"'IP_ttl'"+","+"'IP_frag'"+","+"'IP_flags'"+","+"'IP_id'"+","+"'IP_len'"+","+"'IP_tos'"+","+"'IP_ihl'"+","+"'IP_version'"+","+"'Ethernet_type'"+","+"'Ethernet_src'"+","+"'Ethernet_dst'"+")")
conn.commit()
