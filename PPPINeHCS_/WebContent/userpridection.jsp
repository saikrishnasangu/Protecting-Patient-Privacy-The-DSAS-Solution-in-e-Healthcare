<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="com.controler.Sorting"%>
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
<label>Select From Date</label>
<input type=text name=fromdate id="datepicker1" class="w3-orange w3-button" >
<label>Select To Date</label>
<input type=text name=todate id="datepicker2" class="w3-orange w3-button" >
<input type="submit" value=SORT class="w3-orange w3-button">
</form>
<a href="userhome.jsp" class="w3-button w3-orange w3-left">HOME</a>
<table class="w3-table" style="width: 70%;margin-bottom: 50px;margin-left: 200px;" >
<tr>


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
	fromdate="01/01/2018";
}
if(todate==null)
{
	todate="01/01/2018 ";
}

Date d1=new Date(fromdate);
Date d2=new Date(todate);

ResultSet r=DBConnect.getFpsByUser(uemail);
int tcount=0;
HashMap<String,Integer> h=new HashMap<String,Integer>();
int wm=0,bw=0,tm=0,mat=0,mo=0,nepresso=0,tv=0,lap=0;
while(r.next())
{
	
	if((d1.before(new Date(r.getString(1)))||d1.equals((new Date(r.getString(1)))))&&(d2.after(new Date(r.getString(1)))||d2.equals((new Date(r.getString(1))))))
	{
		tcount++;
		String[] s={"wm","bw","tm","mat","mo","nepresso","tv","lap"};
	
		
	%>
	<tr>
	
	<%
	for(String ss:s)
	{
		int count=DBConnect.getCount(r.getString(1), ss);
		
		if(ss.equals(s[1]))
		{
		bw=bw+count;
		}
		if(ss.equals(s[0]))
		{
		wm=wm+count;
		}
		if(ss.equals(s[2]))
		{
			tm=tm+count;
		}
		if(ss.equals(s[3]))
		{
			mat=mat+count;
		}
		if(ss.equals(s[4]))
		{
			mo=mo+count;
		}
		if(ss.equals(s[5]))
		{
			nepresso=nepresso+count;
		}
		if(ss.equals(s[6]))
		{
			tv=tv+count;
		}
		if(ss.equals(s[7]))
		{
		lap=lap+count;
		}
		
		
		
		
	}
	%>
	</tr>
	<%
	
	}
}
tcount=tcount*3;
System.out.println("wm: "+wm);
System.out.println("bw: "+bw);
System.out.println("tm: "+tm);
System.out.println("mat: "+mat);
System.out.println("mo: "+mo);
System.out.println("nepresso: "+nepresso);
System.out.println("tv: "+tv);
System.out.println("lap: "+lap);
if(wm>=tcount/2)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:   #00cc5f"><%= wm %>/<%= tcount %> </td>
	<%
}else if(wm>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= wm %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= wm %>/<%= tcount %></td>
	<%
}
 

 if(bw>=tcount/2)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:   #00cc5f"><%= bw %>/<%= tcount %></td>
	<%
} else if(bw>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= bw %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= bw %>/<%= tcount %></td>
	<%
}
 

 if(tm>=tcount/2)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:   #00cc5f"><%= tm %>/<%= tcount %></td>
	<%
}else if(tm>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= tm %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= tm %>/<%= tcount %></td>
	<%
}
 

 if(mat>=tcount/2)
 {
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #00cc5f"><%= mat %>/<%= tcount %></td>
	<%
}else if(mat>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= mat %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= mat %>/<%= tcount %></td>
	<%
}
 

 if(mo>=tcount/2)
 {
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #00cc5f"><%= mo %>/<%= tcount %></td>
	<%
}else if(mo>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= mo %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= mo %>/<%= tcount %></td>
	<%
}
 

 if(nepresso>=tcount/2)
 {
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #00cc5f"><%= nepresso %>/<%= tcount %></td>
	<%
}else if(nepresso>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= nepresso %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= nepresso %>/<%= tcount %></td>
	<%
}
 

 if(tv>=tcount/2)
 {
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #00cc5f"><%= tv %>/<%= tcount %></td>
	<%
}else if(tv>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= tv %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= tv %>/<%= tcount %></td>
	<%
}
 
 if(lap>=tcount/2)
 {
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #00cc5f"><%= lap %>/<%= tcount %></td>
	<%
}else if(lap>=tcount/3)
{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #66ffad"><%= lap %>/<%= tcount %></td>
	<%
}else{
	%>
	<td class=" w3-border" style="width: 100px;background-color:  #b3ffd7"><%= lap %>/<%= tcount %></td>
	<%
}
	%>
</table>
<div class="w3-center" style="margin-bottom: 100px;">
PREDICTION:(no of sessions the appliance in on/total no of sessions)
<p><strong CLASS="w3-jumbo" style="color: #00cc5f">&#x26AB;</strong><strong>OVER USAGE</strong>  
<strong CLASS="w3-jumbo" style="color: #66ffad">&#x26AB;</strong><strong>AVERAGE USAGE</strong>
<strong CLASS="w3-jumbo" style="color: #b3ffd7">&#x26AB;</strong><strong>LOW USAGE</strong></p>
</div>
	<%
 
 HashMap<String,Double> ts=new HashMap<String,Double>();
ts.put("WASHING MACHINE",(double) (wm*100)/tcount );
ts.put("BOWL WASHER",(double) (bw*100)/tcount );
ts.put("THREAD MILL",(double) (tm*100)/tcount );
ts.put("YOGA MAT",(double) (mat*100)/tcount );
ts.put("MICROWAVE OVEN",(double) (mo*100)/tcount );
ts.put("NESPRESSO",(double) (nepresso*100)/tcount );
ts.put("TV",(double) (tv*100)/tcount );
ts.put("LAPTOP",(double) (lap*100)/tcount );
Map<String,Double> map=Sorting.sortNow(ts);
int i=0;	
for(Entry<String,Double> set:map.entrySet() )
{
	
	if(i==0)
	{
		%>
		<p><strong style="color:#00cc5f "> <%= set.getKey() %></strong> is the most repeating appliance.</p>	
		<%
	}
	if(i==1)
	{
		%>
			<p><strong style="color:#66ffad "> <%= set.getKey() %></strong> is the second repeating appliance.</p>	
		<%
	}
	if(i==2)
	{
		%>
		<p><strong style="color:#b3ffd7 "> <%= set.getKey() %></strong> is the third repeating appliance.</p>
		<%
	}
	i++;
	
}

if(tcount==0)
 {
	 tcount=1;
 }
%>


<div class="w3-center">

<table class="w3-table" style="width: 50%;margin-left: 200px;margin-bottom: 100px;" >
<tr><td>WASHING MACHINE</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (wm*100)/tcount%>%;"><%= (wm*100)/tcount %>%</div> </td></tr>
<tr><td>BOWL WASHER</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (bw*100)/tcount%>%;"><%= (bw*100)/tcount%>%</div> </td></tr>
<tr><td>THREAD MILL</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (tm*100)/tcount%>%;"><%= (tm*100)/tcount%>%</div> </td></tr>
<tr><td>YOGA MAT</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (mat*100)/tcount%>%;"><%= (mat*100)/tcount%>%</div> </td></tr>
<tr><td>MICROWAVE OVEN</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (mo*100)/tcount%>%;"><%= (mo*100)/tcount%>%</div> </td></tr>
<tr><td>NESPRESSO</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (nepresso*100)/tcount%>%;"><%= (nepresso*100)/tcount%>%</div> </td></tr>
<tr><td>TV</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (tv*100)/tcount%>%;"><%= (tv*100)/tcount%>%</div> </td></tr>
<tr><td>LAPTOP</td><td Style="width: 300px;" class="w3-orange"> <div class="w3-blue" style="width:<%= (lap*100)/tcount%>%;"><%= (lap*100)/tcount%>%</div> </td></tr>
</table>
</div>

</body>
</html>