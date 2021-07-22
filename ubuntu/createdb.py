import mysql.connector

con = mysql.connector.connect(
	host = "mysql",
	user = "root",
	password = "password",
	auth_plugin = 'mysql_native_password'
)

cur = con.cursor()
cur.execute("CREATE DATABASE userinfo")

con.commit()

cur.close()
con.close()

