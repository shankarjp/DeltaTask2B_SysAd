import mysql.connector

con = mysql.connector.connect(
	host = "mysql",
	user = "root",
	password = "password",
	database = "userinfo",
	auth_plugin = 'mysql_native_password'
)

cur = con.cursor()

cur.execute("CREATE TABLE mominfo (date VARCHAR(20), user VARCHAR(20), mom VARCHAR(100))")

file = open('temp.txt','r')
for line in file:
	element = line.split()
	cur.execute("INSERT INTO mominfo (date, user, mom) VALUES (%s, %s, %s)",(element[0], element[1], element[2]))
	
file.close()

con.commit()

cur.close()
con.close()

