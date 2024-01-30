<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registration page</title>
<link rel="StyleSheet" href="w3.css" >
</head>
<body class="w3-blue-grey w3-center">
<h1 style="font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1><br/>
<a CLASS="w3-button w3-orange w3-display-left" href="adminhome.jsp">HOME</a>
<center>
<form action="AddDoctor" method="post">
<h3 class="w3-center">ADD DOCTOR HERE</h3>
<table class="w3-table w3-bordered w3-white" style="width: 400px;" >
<tr><td>Name</td>				<td><input type="text" name=name ></td></tr>
<tr><td>Email</td>				<td><input type="text" name=email></td></tr>
<tr><td>Mobile No.</td>			<td><input type="text" name=mob ></td></tr>
<tr><td>Specialist in </td>		<td><input type="text" name=spe ></td></tr>
<tr><td>Experience(years)</td>	<td><input type="text" name=exp ></td></tr>
<tr><td>Password</td>			<td><input type="text" name=pass ></td></tr>
<tr><td>Select Gender</td>		<td><input type="text" name=gen ></td></tr>
<tr><td><input type="submit" class="w3-green w3-button" style="width: 100%"></td>
<td><input type="reset" class="w3-red w3-button" style="width: 100%"> </td></tr>
</table>
</form>
</center>
</body>
</html>