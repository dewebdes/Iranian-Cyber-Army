#!/usr/bin/python
import cgitb
import sys
cgitb.enable()
import pymysql
from datetime import datetime


def addlog(name, val):
	now = datetime.now()
	tk = now.strftime("%m/%d/%Y, %H:%M:%S")
	conn = pymysql.connect(
	    db='firewall',
	    user='root',
	    passwd='type ur password',
	    host='localhost')
	c = conn.cursor()
	c.execute("INSERT INTO fservicelog (fname,fdatet,fval) VALUES ("+"'"+name+"'"+","+"'"+tk+"'"+","+"'"+val+"'"+")")
	conn.commit()

if __name__ == '__main__':
	#python3 /root/firewall/db.py addlog blockip ip:reason
	addlog(sys.argv[2],sys.argv[3]);
	if sys.argv[1] == 'addlog' :
		print('go log ...')
	
