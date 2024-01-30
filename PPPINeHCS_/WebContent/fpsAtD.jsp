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
<h1 style="font-size: 60px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1><br/><br/>

<form action="fpsAtD.jsp">
<a CLASS="w3-button w3-orange w3-left" href="doctorhome.jsp">HOME</a><STRONG>SORT BY DATE : </STRONG><input type=text name=date id="datepicker" class="w3-orange w3-button" >

<select name=dname class="w3-orange w3-button">
<option value="" >ALL</option>
<%
String date=request.getParameter("date");
if(date==null)
{
	date="";
}
String demail=(String)session.getAttribute("demail");
ResultSet r2=DBConnect.getCons();
while(r2.next())
{
	if(r2.getString(2).equals(demail))
	{
		%>
		<option value="<%= r2.getString(4) %>"><%= r2.getString(5) %></option>		
		<%
	}
}
String uemail=request.getParameter("dname");
if(uemail==null)
{
	uemail="";
}
%>
</select>
<input type="submit" class="w3-button w3-orange" >
</form>
<table class="w3-table">
<tr>
<th>Name</th>
<th>DATE</th>
<th>SHIFT</th>
<th>NO. OF MINUTES</th>
<th>WM</th>
<th>BW</th>
<th>TM</th>
<th>YM</th>
<th>MO</th>
<th>NS</th>
<TH>TV</TH>
<TH>LT</TH>
<th>WORK</th>
<th>FOOD</th>
<th>WORKOUT</th>
<th>REST</th>

</tr>
<% 

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
	<tr style="font-size: 14px;">
	<td><%= r.getString(2) %></td>
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
	<td><a href="msg.jsp?to=<%= r.getString(3)%>">MESSAGE</a></td>
	</tr>
	<%
	}
	}
}
%>
</table>
<center><table class="w3-table" style="width: 500px;">
<tr><th>--</th><th>----------------</th><th></th><th>--</th><th>-------------</th></tr>
<tr><td>WM</td><td>WASHING MACHINE</td><td></td><td>BW</td><td>BOWL WASHER</td></tr>
<tr><td>TM</td><td>THREAD MILL</td><td></td><td>YM</td><td>YOGA MAT</td></tr>
<tr><td>MO</td><td>MICRO OVEN</td><td></td><td>NS</td><td>NESPRESSO</td></tr>
<tr><td>TV</td><td>TELE VISION</td><td></td><td>LT</td><td>LAPTOP</td></tr>
<tr><td></td><td></td><td></td><td></td><td></td></tr>
</table></center>
</body>
</html>