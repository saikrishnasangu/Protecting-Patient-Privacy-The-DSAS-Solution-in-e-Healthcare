<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registration page</title>
<link rel="StyleSheet" href="w3.css" >
</head>
<body class="w3-blue-grey">
<h1 style="font-size: 70px;" class="w3-text-orange">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<center>
<form action="Register" method="post">
<h3 class="w3-center">REGISTER HERE</h3>
<table class="w3-table w3-bordered w3-teal" style="width: 400px;" >
<tr><td>Enter Name</td>			<td><input type="text" name=name ></td></tr>
<tr><td>Enter Email</td>		<td><input type="text" name=email ></td></tr>
<tr><td>Enter Mobile No.</td>	<td><input type="text" name=mob ></td></tr>
<tr><td>Enter Age</td>			<td><input type="text" name=age ></td></tr>
<tr><td>Enter Password</td>		<td><input type="password" name=pass ></td></tr>
<tr><td>Confirm Password</td>	<td><input type="password" name=cpass ></td></tr>
<tr><td>Select Gender</td>		<td><input type="text" name=gen ></td></tr>
<tr><td>Disease</td>		<td><input type="text" name=des ></td></tr>
<tr><td><input type="submit" class="w3-green w3-button" style="width: 100%"></td>
<td><a href="login.jsp" class="w3-text-orange w3-hover-text-white">click here to login</a></td></tr>
</table>
</form>
</center>
</body>
</html>