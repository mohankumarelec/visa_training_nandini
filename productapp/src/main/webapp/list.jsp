<%@page import="com.visa.prj.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
	<h2>Product List</h2>
	<table border="1">
		<tr>
			<th>ID</th><th>Name</th><th>Price</th>
		</tr>
		<%	
			out.print(1);
			List<Product> products = (List<Product>) request.getAttribute("products");
			for(Product p : products) {
		%>
			<tr>
				<td> <%= p.getId() %> </td>
				<td> <%= p.getName() %> </td>
				<td> <%= p.getPrice() %> </td>
			</tr>
		<% 
			}
		%>
	</table>
</body>
</html>



