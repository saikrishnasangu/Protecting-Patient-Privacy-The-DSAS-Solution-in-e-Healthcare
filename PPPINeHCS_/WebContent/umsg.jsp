<%@page import="java.util.Date"%>
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

<center>
<form action="umsg.jsp">
<a href="doctorhome.jsp" class="w3-button w3-white w3-display-left">HOME</a><strong>SELECT USER HERE</strong><select name=dname class="w3-button w3-white">
<%
String uemail=(String)session.getAttribute("demail");
ResultSet r2=DBConnect.getCons();
while(r2.next())
{
	if(r2.getString(2).equals(uemail))
	{
		%>
		<option value="<%= r2.getString(4) %>"><%= r2.getString(5) %></option>		
		<%
	}
}
%>
</select><input type=submit value="get data" class="w3-button w3-orange"></form>
<div style="width: 500px;overflow: auto;max-height: 560px;min-height: 560px;" class="w3-white">
<%
String demail=request.getParameter("dname");
ResultSet r=DBConnect.getMsg();
while(r.next())
{
	if(r.getString(3).equals(uemail)&& r.getString(2).equals(demail))
	{
		%>
		<div class="w3-left w3-blue " style="width: 400px;border-radius:50px 0px 50px 0px;margin-bottom: 10px;">
		<p class="w3-opacity"><%=r.getString(4) %></p>
		<p class=""><%=r.getString(5) %></p>
		</div><br>
		<%
	}else if(r.getString(2).equals(uemail)&& r.getString(3).equals(demail))
	{
		%>
		<div class="w3-right w3-green" style="width: 400px;border-radius:50px;border-radius: 0px 50px 0px 50px;margin-bottom: 10px;">
		<p class="w3-opacity"><%=r.getString(4) %></p>
		<p  class=""><%=r.getString(5) %></p>
		</div>
		<%
	}
}
%></div>
<div style="bottom: 0px;position: fixed;left: 433px;">
<form action="Pmsing" method="post">
<input type="hidden" name=from value="<%= uemail%>">
<input type="hidden" name=to value="<%= demail%>">
<table class="w3-table w3-white" style="width: 500px;">
<tr><td><textarea name=msg class="" cols="40" ></textarea></td><td><input type=submit value=SEND class="w3-green w3-button " style="width: 100%;">
</td></tr>
</table></form></div>
</center>
</body>
</html>