import mysql.connector

con = mysql.connector.connect(
	host = "mysql",
	user = "root",
	password = "password",
	database = "userinfo",
	auth_plugin = 'mysql_native_password'
)

cur = con.cursor()

cur.execute("ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'password'")
cur.execute("FLUSH PRIVILEGES")

con.commit()

cur.close()
con.close()