def readlayers():
	global gcu
	gcu.execute("select namefull,clsname from layers;")
	result = gcu.fetchall()
	return list(result)

def getlidx():
	global gcu
	gcu.execute("select idx from packets order by id desc limit 1;")
	result = gcu.fetchall()
	return list(result)
