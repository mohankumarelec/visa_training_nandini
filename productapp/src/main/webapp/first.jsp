<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>first page</title>
</head>
<body>
	<h1>Unicode Characters &#2309;</h1>
	<%
		for(int i = 2305; i <= 3200; i++) {
	%>
		<br /> Character  : &#<%= i %>; for the value <%= i %>
	<% 
		}
	%>
</body>
</html>