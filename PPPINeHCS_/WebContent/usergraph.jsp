<%@page import="java.util.HashMap"%>
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
	  $( "#datepicker1" ).datepicker({  maxDate:0 });
	 });
$(function() {
	  $( "#datepicker2" ).datepicker({  maxDate:0 });
	 }); 
	 </script>
</head>
<body class="w3-blue-grey  w3-center">
<h1 style="font-size: 60px;" class="w3-text-white">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1><br/><br/>
<form action="">
<label>Select From Date : </label>
<input type=text name=fromdate id="datepicker1" class="w3-orange w3-button" >
<label>Select To Date : </label>
<input type=text name=todate id="datepicker2" class="w3-orange w3-button" >
<input type="submit" value=SORT class="w3-orange w3-button">
</form>
<a href="userhome.jsp" class="w3-button w3-orange w3-left">HOME</a>
<table class="w3-table" style="width: 70%;margin-bottom: 100px;margin-left: 200px;" >
<tr>
<th>DATE</th>

<th>WASHING MACHINE</th>
<th>BOWL WASHER</th>
<th>THREAD MILL</th>
<th>YOGA MAT</th>
<th>MICROWAVE OVEN</th>
<th>NESPRESSO</th>
<TH>TV</TH>
<TH>LAPTOP</TH>


</tr>
<% 
String fromdate=request.getParameter("fromdate");
String todate=request.getParameter("todate");
String uemail=(String)session.getAttribute("uemail");
if(fromdate==null)
{
	fromdate="01/01/2022";
}
if(todate==null)
{
	todate="01/01/2022";
}

Date d1=new Date(fromdate);
Date d2=new Date(todate);

ResultSet r=DBConnect.getFpsByUser(uemail);
HashMap<String,Integer> h=new HashMap<String,Integer>();
while(r.next())
{
	
	if((d1.before(new Date(r.getString(1)))||d1.equals((new Date(r.getString(1)))))&&(d2.after(new Date(r.getString(1)))||d2.equals((new Date(r.getString(1))))))
	{
		String[] s={"wm","bw","tm","mat","mo","nepresso","tv","lap"};
		int em,bw,tm,mat,nepresso,tv,lap;
	%>
	<tr>
	<td><%= r.getString(1) %></td>
	
	<%
	for(String ss:s)
	{
		
		int count=DBConnect.getCount(r.getString(1), ss);
		System.out.println("date: "+r.getString(1)+" prop :"+ss);
		if(count==3)
		{
			%>
			<td class=" w3-border" style="width: 100px;background-color:   #00cc5f"></td>
			<%
		}
		else if(count==2)
		{
			%>
			<td class=" w3-border" style="width: 100px;background-color:   #66ffad"></td>
			<%
		}else  if(count==1)
		{
			%>
			<td class=" w3-border" style="width: 100px;background-color:   #b3ffd7"></td>
			<%
		}else{
			%>
			<td class=" w3-border" style="width: 100px;background-color:  #ffffff"></td>
			<%
		}
	}
	%>
	
	<%-- 	<td><%= r.getString(2) %></td> --%>

	</tr>
	<%
	}
	
}
%>
</table>
<div class="w3-center">

<p><strong CLASS="w3-jumbo" style="color: #00cc5f">&#x26AB;</strong><strong>OVER USAGE</strong>  
<strong CLASS="w3-jumbo" style="color: #66ffad">&#x26AB;</strong><strong>AVERAGE USAGE</strong>
<strong CLASS="w3-jumbo" style="color: #b3ffd7">&#x26AB;</strong><strong>LOW USAGE</strong>
<strong CLASS="w3-jumbo" style="color: #ffffff">&#x26AB;</strong><strong>NO USAGE</strong></p>
</div>
</body>
</html>