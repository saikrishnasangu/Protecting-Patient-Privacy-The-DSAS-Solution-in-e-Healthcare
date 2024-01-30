<%@page import="com.controler.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="StyleSheet" href="w3.css">
</head>
<body class="w3-blue-grey w3-center">
	<h1 style=" font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
	<center>
		<br>
		<a CLASS="w3-button w3-orange" href="adminhome.jsp">HOME</a>
		<br>		<br>		
		<table class="w3-card w3-white w3-padding w3-table w3-bordered"	style="width: 400px">
					<tr>
				<th>ID:</th>
				<th>Name:</th>
				<th>Email:</th>
				<th>Mobile:</th>
				<th>Age:</th>
				<th>Gender:</th>
				<th>Decease:</th>
		</tr>
		
			<%
			
				ResultSet r2 = DBConnect.getUser();
				while (r2.next()) {
					
			%>

			<tr>
	
				<td><%=r2.getString(1)%></td>
				<td><%=r2.getString(2)%></td>
				<td><%=r2.getString(3)%></td>
				<td><%=r2.getString(4)%></td>
				<td><%=r2.getString(5)%></td>
				<td><%=r2.getString(7)%></td>
				<td><%=r2.getString(8)%></td>
</tr>
				<%
					}
					
				%>
			
		</table>
	</center>
</body>
</html>
