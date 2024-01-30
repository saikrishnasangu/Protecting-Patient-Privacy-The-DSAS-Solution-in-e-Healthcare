<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="StyleSheet" href="w3.css" >

</head>
<body>
<body class="w3-blue-grey w3-center" >
<h1 style="font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<center>
<br>
<a href="doctorhome.jsp" class="w3-button w3-orange">HOME</a>
<br><br><br>
<%
String to=request.getParameter("to");
%>
<form action="Messaging" method="post"><table class="w3-table w3-white" style="width: 400px;">
<tr><td>FROM</td><td><input type="text" name=from value="<%= session.getAttribute("demail")%>"></td></tr>
<tr><td>TO</td><td><input type="text" name=to value=<%=to %>></td></tr>
<tr><td>MESSAGE</td><td><textarea rows="3" cols="20" name=msg ></textarea> </td></tr>
<tr><td></td><td><input type="submit" value=SEND class="w3-orange w3-button" style="width: 100%;" >  </td></tr>
</table></form>
</center>
</body>
</html>