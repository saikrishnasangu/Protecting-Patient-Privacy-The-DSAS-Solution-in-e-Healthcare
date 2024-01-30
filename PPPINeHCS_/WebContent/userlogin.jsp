<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login page</title>
<link rel="StyleSheet" href="w3.css" >
<style type="text/css">
.login{
display: inline-block;
height: 400px;
}
</style>
</head>
<body class="w3-blue-grey w3-center">
<h1 style="font-size: 70px;" class="w3-text-white">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<div class="login w3-card-4 w3-center w3-padding">
<img alt="user" src="logos/user.png" style="width: 150px;height: 150px;border-radius:50%;">
<h3 class="w3-teal">User login</h3>
<form action="Ulogin" method="post">
<table>
<tr><td><strong class="w3-text-white">Email</strong></td><td><input type="text" name=email class="w3-input"></td></tr>
<tr><td><strong class="w3-text-white">Password</strong></td><td><input type="password" name=pass class="w3-input"></td></tr>
<tr><td><a href=reg.jsp class="w3-text-red w3-hover-text-red" >Click here<br> to register</a></td><td><input type=submit value=LOGIN class="w3-button w3-blue" style="width: 100%"></td></tr>
</table></form>
</div>

</body>
</html>