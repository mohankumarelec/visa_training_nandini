
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
	JSE: Java Std Edition ==> Standalone application

	Java Enterprise Edition
	-----------------------
		a) Web Application
		b) Distributed applications
		Applications of large scale

	Servlet is a technology to write server side java program

	Old Version: < Servlet version 2.5 
	web.xml
	<servlet>
		<servlet-name>login</serlvet-name>
		<serlvet-class>com.visa.prj.web.LoginServlet</serlvet-class>
	</servlet>
	<serlvet-mapping>
			<servlet-name>login</serlvet-name>
			<url-pattern>/loginc</url-pattern>
	</servlet-mapping>



	@WebServlet("/login")
	public class LoginServlet extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res) {

		}
		public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		}
	}

goals=> jetty:run

https://github.com/BanuPrakash/visa_frameworks

==========

Day 2:

	void service(ServletRequest req, ServletResponse res);
					|
					v
	void service(HttpServletRequest req, HttpServletResponse res);
					|
					v
	void doGet(HttpServletRequest req, HttpServletResponse res);
	void doPost(HttpServletRequest req, HttpServletResponse res);
	================

	JSP ==> Java Server Pages
	HTML ==> Static
	Servlet ==> Dynamic content [ Good for Application Logic]
	JSP ==> Static + Dynamic [ Good for Presentation]

	---

	Scriptlets:
		<%
			Java statements
		%>
	Expression:
		<%= variable %>
		way to send output to browser
		equivalent to :

		out.print(variable);
	Directives:
		<%@ %>
			page
				import
				language
				content-type
			taglib
	============================================
	JSP implicit objects:
		out ==> JspWriter	extends PrintWriter
		request ==> HttpServletRequest
		response ==> HttpServletResponse
		application ==> ServletContext
		session ==> HttpSession
		pageContext ==> PageContext
		config ==> ServletConfig
	=============

	HTTP protocol is a stateless protocol, it doesn't track the
	converstational state of client

	HttpSession API can be used to track converstional state of client ==> Session Tracking

	Methods of HttpSession:

		HttpSession ses = request.getSession();

					// create a session if it doesn't exist
					// if it exists give a ref to it
					request.getSession(true);

					// return reference to existing session.
					// won't create a new session
					request.getSession(false);
		void invalidate() ; // terminate the session => logout
		void setMaxInactiveInterval(seconds); // 20 min default

		void setAttribute(String key, Object val);
		Object getAttribute(String key);
		void removeAttribute(String key);






