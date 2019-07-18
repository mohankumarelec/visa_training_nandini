
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
==================================================
	Steps:
	->localhost:8080
	-> opens index.html
	in "index.html" i click "Login" takes you to "login.html"

	login.html:
		user enters email and pwd and clicks on "login button"
		action="LoginServlet" method="post"
	LoginServlet doPost():
		we create a HttpSession
		in session store "user", email
						  "cart", empty arraylist
		redirect to "index.html"
	in "index.html"
		click "products" ==> ProductServlet doGet()
		in doGet() we fetch products from DB and store
			it as "products" key in request scope
			do server side redirecction to "products.jsp"
	in "products.jsp"
		we create a form on submit it sends selected "items" to
		CartServlet doPost()
	in CartServlet doPost():
		get "cart" from session
		read "items" selected checkboxes
		get product using the id
		add selected products into cart
		redirect to "cart.jsp"
================================
Day 3:
-----
	To read HTML form fields or Query Parameter:
	
	http:server.com?name=Smith&age=25

	String getParameter("nameOfParameter");
	String[] getParameterValues("nameOfParameter");

	Redirect:
		a) Client Side Redirection
			response.sendRedirect("page");
			Here traffic between client and server happens twice.
			We can't use this to carry info from one resource to another
		b) Server Side Redirection
			MultiStage processing of Data
			Within Application:
			request.getRequestDispacther("resource").forward(request,response)

			Between Application:
			servletContext..getRequestDispacther("resource").forward(request,response)
	--------------------
	Filter --> interceptors
				Security, Profile, Encrpty-Decrypt
	---------------------

	ServletContext
		--> can be used to share information between clients and resources
		${applicationScope}
	HttpSession in JSP ${sessionScope}
	----------------	

	JSP, Servlet, Filter executes based on client request mapped with URL

	Listener gets executed based on events happening within a engine

		ServletContextListener
		HttpSessonListener
		HttpSessionBindingListener
		HttpServletRequestListener
		...

====================
	Servlet Lifecylce
		init()
			service() ==> doGet(), doPost(),...
		destroy()
====================

	Spring Framework and JPA framework
	----------------------------------

	Spring Framework:
		* It's a lightweight application framework which provides a
		container for implementing Inversion Of Control (DI)
			As on now the flow:
			Servlet --> Service --> Dao --> Connects to DB
			What Spring brings:
			Dependency Injection (DI --> IoC)
			Servlet <-- Service <-- Dao <--  DB Connection
		* Spring manages the lifycycle of objects
		* Spring focuses on the "plumbing" of enterprise applications so that teams can focus on application-level business logic, without unnecessary ties to specific deployment environments.

	=========
	Spring manages lifecyle of objects whose class has one of these
	annotations:
	@Component
	@Repository
	@Service
	@Controller
	@RestController
	@Configuration


	@Repository
	public class ProductDaoJdbcImpl implements ProductDao {

	}

	@Service
	public class OrderService {
		@Autowired
		private ProductDao productDao;
	}

	beans.xml
	---------

		<bean id="productDao" class="com.visa.prj.dao.ProductDaoJpaImpl" />

		<bean id="orderservice" class="com.visa.prj.service.OrderService" autowire="byType" />
=======================================================================

	ORM Frameworks and JPA [ Java Persistence API]

	Object Relational Mapping frameworks helps in CRUD Operations on RDBMS

	Object <------------> Relational database mapping

	@Table
	@Column

	JP-QL ==> Java Persistnce Query Language

	SQL 					
		a) uses table and column names
		b) not case-sensitive
		Example:
			select * from customers
			select * from customers where first_name ='Raj'
	JPQL
		a) uses class and field names
		b) case-sensitive for class and field names
			select c from Customer c
				OR
				from Customer
			select c from Custoemr c where c.firstName = 'Raj'
				OR
				from Customer c where c.firstName = 'Raj'
			select firstName from Customer
		c) Polymorphic
			from Object
			from Product
				if Mobile extends Product
				if Tv extends Product
				will fetch data from product table, mobile and tv table

====================================

	DataSource ==> EntityManagerFactory ==> EntityManager [ manages PersistenceContext]


	DriverManger --> Establish Connection
	In an enterprise app we need pool of database connections
	DataSource is a pool of database connections.

	EntityManagerFactory	
			picks a connection from pool
			selects ORM provider
			and creates PersistenceContext maanged by EntityManager

	 ===========
	  @Repository
	 class ProductDaoJpaImpl implements ProductDao {
	 	///
	 }
	 class SomeClass {

	 }

	 @Configuration
	 class Config {
	 	@Bean
	 	public SomeClass doTask() {
	 		SomeClass obj = new SomeClass(...);
	 		obj.doTaht();
	 		obj.doThis();
	 		return obj;
	 	}
	 }
	

	 @Service
	 class ORderSErvice {
	 	@Autowired
	 	ProductDao productDao;
	 	@Autowired
	 	SomeClass clazz;
	 }
================================================
	
	Transaction --> ATOMIC

		placeOrder(Order o){
			insert one row in orders table
			insert n rows in items table
			UPDATE n rows in products table
		}

	JDBC --> Autocommit true
	Spring --> Autocommit false

	Transaction can Deaclarative or programmatic

		Programmatic TX:
		using JDBC:
		public void placeOrder(Order o) {
			Connection con = null;
			try {
				con.setAutoCommit(false);
					SQL1 = "insert into orders ....";
					SQL2 = "insert into items ....";
					SQL3 = "update product set ....";

					ps1.executeUpdate(SQL1);
					for(Item i : items) {
						ps2.set parameters
						ps2.executeUpdate(SQL2);
					}

					for(Product p : items.products) {
						ps3.set parameters
						ps3.executeUpdate(SQL3);
					}
				con.commit();
			} catch(SQLException ex) {
				con.rollback();
			}
		}

		using Hibernate:
		public void placeOrder(Order o) {
			Session ses = null;
			try {
				ses.beginTransaction();
					

					ses.persist(o);
					for(Item i : items) {
						ses.persist(i);
					}

					for(Product p : items.products) {
						ses.update(p);
					}
				ses.getTrransaction().commit();
			} catch(SQLException ex) {
				ses.getTrransaction().rollback();
			}
		}

		=======

		Declarative Tx:

		@Transactional
		placeOrder(Order o){
			insert one row in orders table
			insert n rows in items table
			UPDATE n rows in products table
		}
		================================

		