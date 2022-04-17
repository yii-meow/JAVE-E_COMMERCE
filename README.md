Configuration & software needed
1. Glassfish 5.1 Server Local
2. MySQL Workbench 8.0
3. MySQL-connector-java-8.0.28 & 5.1.47 jar
4. Java EE Web 7
5. Eclipse Link JPA 2.1
6. Netbeans 13
7. Java JDK 1.8

Storing MySql jar to glassfish folder
1. Please import the MySQL query from the “query” folder first.
2. Go to netbeans database > right click databases > new connections >
3. Driver choose MySQL(Connector/J Driver)
4. Driver file add the file downloaded just now with the name of 8.0.28.jar
Host : jdbc:mysql://localhost:3306/e-commerce, Port: 3306
Database: (databasename)
User Name: root (or your mysql username)
Password: (empty / or your mysql password)

Setup Mysql database
1. Please put the MySQL 8.0.28 & 5.1.47 jar into glassfish/domain/domain1/lib first
2. Next, click Glassfish Domain Console, and find JDBC Connection Pools, and create a new Pool
Name, select “javax.sql.DataSource” as Resource Type, and MySql as Database Driver Vendor.
3. Go to your windows explorer glassfish server location,
“glassfish/domains/domain1/config/domain.xml”, open as notepad, and find for the JDBC
Connection Pools, which you created just now. Add these 3 below property under the pool, save
it, and restart glassfish server.
<property name="user" value="root"></property>
<property name="password" value=""></property>
<property name="url" value="jdbc:mysql://localhost:3306/e-commerce"></property>
Go to your glassfish server folder (C:\Users\xxx\GlassFish_Server\glassfish\domains\domain1\lib), and
paste the file downloaded just now with the name 5.1.47.jar inside here, and paste one more time
inside the ./ext folder. Go to (C:\Users\xxx\GlassFish_Server\glassfish\lib) and paste the file inside here
also.
Start your glassfish server, right click and choose View Domain Admin Console
Go to JDBC > JDBC Resources , click New
JNDI Name: (any name you remember)
Pool Name: (jdbc connection pool name which is created just now)
Click OK, and all DONE
