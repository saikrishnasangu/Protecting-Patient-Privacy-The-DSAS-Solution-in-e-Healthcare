<%@page import="com.controler.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DOCTORS LIST</title>
<link rel="StyleSheet" href="w3.css" >
</head>
<body class="w3-blue-grey w3-center">
<h1 style="font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<a href="userhome.jsp" class="w3-button w3-orange w3-left">HOME</a><br><br>
<table class="w3-table w3-bordered w3-teal">
<tr class="w3-card-4 w3-pink">
<th>DOCTOR ID</th>
<th>NAME</th>
<th>EMAIL</th>
<th>MOBILE NO.</th>
<th>SPECIALIST</th>
<th>EXPERIENCE</th>
<th>GENDER</th><th></th>
</tr>
<%
ResultSet r=DBConnect.getDoctor();
while(r.next())
{
	%>
	<form action="Urequest" method="post">
	<tr class="w3-hover-white w3-card-4">
	<td><%=r.getString(1) %><input type="hidden" name=did 		value="<%=r.getString(1) %>"></td>
	<td><%=r.getString(2) %><input type="hidden" name=dname 	value="<%=r.getString(2) %>"></td>
	<td><%=r.getString(3) %><input type="hidden" name=demail 	value="<%=r.getString(3) %>"></td>
	<td><%=r.getString(4) %><input type="hidden" name=dmobile 	value="<%=r.getString(4) %>"></td>
	<td><%=r.getString(5) %><input type="hidden" name=dspe 		value="<%=r.getString(5) %>"></td>
	<td><%=r.getString(6) %><input type="hidden" name=dexp 		value="<%=r.getString(6) %>"></td>
	<td><%=r.getString(8) %><input type="hidden" name=dgender 	value="<%=r.getString(7) %>"></td>
	<td><input type="submit" value="REQUEST" class="w3-pink w3-round w3-button"></td>
	</tr>
	</form>
	<%
}

%>
</table>
</body>
</html>