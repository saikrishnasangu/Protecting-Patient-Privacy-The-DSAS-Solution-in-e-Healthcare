<%@page import="com.controler.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="connecteddocs.jsp">
<select name=dname>
<%
String uemail=(String)session.getAttribute("uemail");
ResultSet r=DBConnect.getCons();
while(r.next())
{
	if(r.getString(4).equals(uemail))
	{
		%>
		<option value="<%= r.getString(2) %>"><%= r.getString(3) %></option>		
		<%
	}
}
%>
</select><input type=submit value="get data"></form>

<% 
String demail=request.getParameter("dname");
ResultSet r2=DBConnect.getDoctor();
while(r2.next())
{
	if(r2.getString(3).equals(demail))
	{
		%>
		<table>
		<tr><td>Doctor ID:</td><td><%= r2.getString(1) %> </td></tr>
		<tr><td>Doctor Name:</td><td><%= r2.getString(2) %> </td></tr>
		<tr><td>Doctor Email:</td><td><%= r2.getString(3) %> </td></tr>
		<tr><td>Doctor Mobile:</td><td><%= r2.getString(4) %> </td></tr>
		<tr><td>Specialist In:</td><td><%= r2.getString(5) %> </td></tr>
		<tr><td>Experience(Years):</td><td><%= r2.getString(6) %> </td></tr>
		<tr><td>Gender :</td><td><%= r2.getString(8) %> </td></tr>
		</table>
		<%
	}
}
%>
</body>
</html>
