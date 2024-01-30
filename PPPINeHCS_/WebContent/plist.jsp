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
</head>
<body class="w3-blue-grey">
<h1 style="font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<br><a CLASS="w3-button w3-orange" href="doctorhome.jsp">HOME</a><br><br>
<center><form action="plist.jsp">
<select name=dname class="w3-orange w3-button">
<option value="" >ALL</option>
<%
String uemail=(String)session.getAttribute("demail");
ResultSet r=DBConnect.getCons();
while(r.next())
{
	if(r.getString(2).equals(uemail))
	{
		%>
		<option value="<%= r.getString(4) %>"><%= r.getString(5) %></option>		
		<%
	}
}
%>
</select> <input type=submit value="get data" class="w3-button w3-orange"></form><br><br>

<% 
String demail=request.getParameter("dname");
ResultSet r2=DBConnect.getUser();
while(r2.next())
{
	if(r2.getString(3).equals(demail))
	{
		%>
		<table class="w3-card w3-white w3-padding w3-table w3-bordered" style="width: 400px">
		<tr><td> ID:</td><td><%= r2.getString(1) %> </td></tr>
		<tr><td> Name:</td><td><%= r2.getString(2) %> </td></tr>
		<tr><td> Email:</td><td><%= r2.getString(3) %> </td></tr>
		<tr><td> Mobile:</td><td><%= r2.getString(4) %> </td></tr>
		<tr><td> Age:</td><td><%= r2.getString(5) %> </td></tr>
		<tr><td> Gender:</td><td><%= r2.getString(7) %> </td></tr>
		<tr><td> Decease:</td><td><%= r2.getString(8) %> </td></tr>
		</table><br><br>
		<%
	}
}
%></center>
</body>
</html>
