<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Welcome, ${user} <br />
	<a href="LoginServlet">Sign out</a>
	<h2>Cart List using JSTL</h2>
	<table border="1">
		<tr>
			<th>ID</th><th>Name</th><th>Price</th>  
		</tr>
		<c:forEach items="${cart}" var="p">
			<tr>
				<td>${p.id}</td>
				<td>${p.name}</td>
				<td>${p.price}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="products">Back to Product List</a>
</body>
</html>






