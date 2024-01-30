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

<script src="jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="jquery-ui.css">
<script src="jquery-ui.js"></script>
<link rel="StyleSheet" href="w3.css" >

<script type="text/javascript">
$(function() {
	  $( "#datepicker" ).datepicker({  maxDate:0 });
	 });
	 
	 </script>
</head>
<body class="w3-blue-grey  w3-center">
<h1 style="font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<a href="userhome.jsp" class="w3-button w3-orange w3-left">HOME</a>
<form action="ufps.jsp">
<input type=text name=date id="datepicker" class="w3-orange w3-button" >
<input type="submit" value=SORT class="w3-orange w3-button">
</form>
<table class="w3-table">
<tr>
<th>DATE</th>
<th>SHIFT</th>
<th>NO. OF MINUTES</th>
<th>WASHING MACHINE</th>
<th>BOWL WASHER</th>
<th>THREAD MILL</th>
<th>YOGA MAT</th>
<th>MICROWAVE OVEN</th>
<th>NESPRESSO</th>
<TH>TV</TH>
<TH>LAPTOP</TH>
<th>WORK</th>
<th>FOOD</th>
<th>WORKOUT</th>
<th>REST</th>

</tr>
<% 
String date=request.getParameter("date");
String uemail=(String)session.getAttribute("uemail");
if(date==null)
{
	date="";
}
ResultSet r=DBConnect.getFps();
while(r.next())
{
	if(r.getString(3).equals(uemail))
	{
	if(date.equals(r.getString(4))||date.equals(""))
	{
		int work=r.getInt(7)+r.getInt(8);
		int eat=r.getInt(11)+r.getInt(12);
		int yoga=r.getInt(9)+r.getInt(10);
		int rest=r.getInt(13)+r.getInt(14);
	%>
	<tr>
<%-- 	<td><%= r.getString(2) %></td> --%>
	<td><%= r.getString(4) %></td>
	<td><%= r.getString(5) %></td>
	<td><%= r.getString(6) %></td>
	<td><%= r.getString(7) %></td>
	<td><%= r.getString(8) %></td>
	<td><%= r.getString(9) %></td>
	<td><%= r.getString(10) %></td>
	<td><%= r.getString(11) %></td>
	<td><%= r.getString(12) %></td>
	<td><%= r.getString(13) %></td>
	<td><%= r.getString(14) %></td>
	<td><%
	if(work==0)
	{
		out.println("<strong class='w3-text-yellow'>LOW</strong>");
	}else if(work==1)
	{
		out.println("<strong class='w3-text-green'>AVERAGE</strong>");
		
	}else{
		out.println("<strong class='w3-text-red'>OVER</strong>");
		
	}
	%></td>
	<td><%
	if(eat==0)
	{
		out.println("<strong class='w3-text-yellow'>LOW</strong>");
	}else if(eat==1)
	{
		out.println("<strong class='w3-text-green'>AVERAGE</strong>");
		
	}else{
		out.println("<strong class='w3-text-red'>OVER</strong>");
		
	}
	%></td>
	<td><%
	if(yoga==0)
	{
		out.println("<strong class='w3-text-yellow'>LOW</strong>");
	}else if(yoga==1)
	{
		out.println("<strong class='w3-text-green'>AVERAGE</strong>");
		
	}else{
		out.println("<strong class='w3-text-red'>OVER</strong>");
		
	}
	%></td>
	<td><%
	if(rest==0)
	{
		out.println("<strong class='w3-text-yellow'>LOW</strong>");
	}else if(rest==1)
	{
		out.println("<strong class='w3-text-green'>AVERAGE</strong>");
		
	}else{
		out.println("<strong class='w3-text-red'>OVER</strong>");
		
	}
	%></td>
	</tr>
	<%
	}
	}
}
%>
</table>
</body>
</html>