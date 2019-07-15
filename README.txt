
Java Enterprise Edition
-----------------------
	Maven is a java tool
		==> Dependency Management [ pom.xml ==> Project Object Model]
		==> Std Project Structure
		==> Goals configuration
			clean compile tests build

		<build>
		<plugins>
			 
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.1</version>
				<configuration>
					<source>1.8</source>
					<target>1.8</target>
				</configuration>
			</plugin>
		</plugins>
	</build>
	JDBC --> Integration libraries used to communicate with RDBMS

	Java Database Connectivity:
		JRE provides interfaces, implementation classes are provided
		by database vendors

	https://sqlzoo.net/

	mysql> create database visa_db;
	mysql> use visa_db;

	create table products (id int PRIMARY KEY AUTO_INCREMENT, name VARCHAR(100), price double, category VARCHAR(100), count int);

	insert into products values (0,'iPhone XR', 45000.00, 'mobile', 100);
	insert into products values (0,'Samsung Joy', 135000.00, 'tv', 100);
	insert into products values (0,'OnePlus 7', 63000.00, 'mobile', 100);

	select * from products;


	JDBC:
		Steps to connect to database:

		1) Load classes provided by database vendors

			Class.forName(...);
		2) Establish a database connection using getConnection() factory method

		Connection con = DriverManager.getConnection(URL, USER, PWD);

		Example of URL:
		jdbc:mysql://localhost:3306/visa_db
		jdbc:oracle:thin:@145.55.22.56:1521:visa_db

		3) Send SQL [ DML] avoid sending DDL [create, alter, drop] from Java
			Java provides 3 interfaces :
				a) Statement
					for SQL which is fixed
					"select * from products";
				b) PreparedStatement
					SQL with IN parameters
					"select * from users where username=? and password =?"
					Avoid:
					"select * from users where username='" + u + "'
						and password ='" + p +"'";


				c) CallableStatement
					to invoke Stored Procedures
		4) ResultSet
			cursor to retreived results of "SELECT statement"

		
		mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';
		==========

		mysql> CREATE USER 'visa'@'localhost' IDENTIFED BY 'root';

		mysql> GRANT ALL PRIVILEGES ON *.* TO 'visa'@'localhost';
		================

		executeQuery() ==> SELECT
		executeUpdate() ==> INSERT, DELETE OR update
=======================================================================



