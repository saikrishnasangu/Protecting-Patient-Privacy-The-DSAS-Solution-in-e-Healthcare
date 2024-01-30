<%@page import="com.controler.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="StyleSheet" href="w3.css" >
<link rel="StyleSheet" href="w3.css" >
</head>
<body class="w3-blue-grey">
<h1 style="font-size: 70px;" class="w3-text-white">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<br><a CLASS="w3-button w3-orange" href="doctorhome.jsp">HOME</a><br><br>
<table  class="w3-table w3-bordered w3-teal" >
<%
String demail=(String)session.getAttribute("demail");
ResultSet r=DBConnect.getUReq();
while(r.next())
{
	if(demail.equals(r.getString(3)))
	{
		%>
		<tr><form action="Rconnect" method="post" >
		<td><input type="hidden" name=rid value=<%= r.getString(1) %>><%= r.getString(5) %><input type="hidden" name=demail value=<%= r.getString(3) %>><input type="hidden" name=dname value=<%= r.getString(4) %>></td>
		<td><%= r.getString(6) %><input type="hidden" name=uname value=<%= r.getString(6) %>></td>
		<td><%= r.getString(7) %><input type="hidden" name=uemail value=<%= r.getString(7) %>></td>
		<td><%= r.getString(8) %></td>
		<td><%= r.getString(9) %></td>
		<td><%= r.getString(10) %></td>
		<td><input type="submit" value=CONNECT class="w3-pink w3-button"></td>
		</form></tr>
		
		<%
	}
}
%>
</table>
</body>
</html>