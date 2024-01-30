<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="StyleSheet" href="w3.css" >
<style type="text/css">
.logos{
width: 100px;
height: 100px;
}
select{
width: 70%;
}
</style>
<script src="jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="jquery-ui.css">
<script src="jquery-ui.js"></script>

<script type="text/javascript">
$(function() {
	  $( "#datepicker" ).datepicker({  maxDate:0 });
	 });
	 </script>
	 <script type="text/javascript">
	 function gettime()
	 {
		 var shift=document.getElementById("shift").value;
		 var from=document.getElementById("from");
		 var to=document.getElementById("to");
		 if(shift=='morning')
			 {
			from.appendChild(new Option("06:00 AM", "0"));
			from.appendChild(new Option("06:15 AM", "15"));
			from.appendChild(new Option("06:30 AM", "30"));
			from.appendChild(new Option("06:45 AM", "45"));
			from.appendChild(new Option("07:00 AM", "60"));
			from.appendChild(new Option("07:15 AM", "75"));
			from.appendChild(new Option("07:30 AM", "90"));
			from.appendChild(new Option("07:45 AM", "105"));
			from.appendChild(new Option("08:00 AM", "120"));
			
			to.appendChild(new Option("07:00 AM", "60"));
			to.appendChild(new Option("07:15 AM", "75"));
			to.appendChild(new Option("07:30 AM", "90"));
			to.appendChild(new Option("07:45 AM", "105"));
			to.appendChild(new Option("08:00 AM", "120"));
			to.appendChild(new Option("08:15 AM", "135"));
			to.appendChild(new Option("08:30 AM", "150"));
			to.appendChild(new Option("08:45 AM", "165"));
			to.appendChild(new Option("09:00 AM", "180"));
			
			 }else if(shift=='afternoon')
			 {
					from.appendChild(new Option("12:00", "0"));
					from.appendChild(new Option("12:15", "15"));
					from.appendChild(new Option("12:30", "30"));
					from.appendChild(new Option("12:45", "45"));
					from.appendChild(new Option("01:00", "60"));
					from.appendChild(new Option("01:15", "75"));
					from.appendChild(new Option("01:30", "90"));
					from.appendChild(new Option("01:45", "105"));
					from.appendChild(new Option("02:00", "120"));
					
					to.appendChild(new Option("01:00", "60"));
					to.appendChild(new Option("01:15", "75"));
					to.appendChild(new Option("01:30", "90"));
					to.appendChild(new Option("01:45", "105"));
					to.appendChild(new Option("02:00", "120"));
					to.appendChild(new Option("02:15", "135"));
					to.appendChild(new Option("02:30", "150"));
					to.appendChild(new Option("02:45", "165"));
					to.appendChild(new Option("03:00", "180"));
					
				 }else if(shift=='evening')
				 {
					 from.appendChild(new Option("06:00 PM", "0"));
						from.appendChild(new Option("06:15 PM", "15"));
						from.appendChild(new Option("06:30 PM", "30"));
						from.appendChild(new Option("06:45 PM", "45"));
						from.appendChild(new Option("07:00 PM", "60"));
						from.appendChild(new Option("07:15 PM", "75"));
						from.appendChild(new Option("07:30 PM", "90"));
						from.appendChild(new Option("07:45 PM", "105"));
						from.appendChild(new Option("08:00 PM", "120"));
						
						to.appendChild(new Option("07:00 PM", "60"));
						to.appendChild(new Option("07:15 PM", "75"));
						to.appendChild(new Option("07:30 PM", "90"));
						to.appendChild(new Option("07:45 PM", "105"));
						to.appendChild(new Option("08:00 PM", "120"));
						to.appendChild(new Option("08:15 PM", "135"));
						to.appendChild(new Option("08:30 PM", "150"));
						to.appendChild(new Option("08:45 PM", "165"));
						to.appendChild(new Option("09:00 PM", "180"));
											 }
	 }
	 </script>
</head>
<body class="w3-blue-grey">
<center>
<h1 style="font-size: 70px;" class="w3-text-white">A Secure Data Sharing and Authorized Searchable Framework for e-Healthcare System</h1>
<a href="userhome.jsp" class="w3-button w3-orange w3-display-left">HOME</a><h1 class="w3-teal w3-center" style="width: 700px; " >UPDATE DATA HERE</h1>
<form action="UploadDailyData" method="post">
<table class=" w3-table w3-bordered w3-teal " style="width: 700px; ">
<tr><td><strong>User Name</strong></td><td><input type=text name=uname  class="w3-blue-grey w3-input"></td><td><strong>Email</strong></td><td><input type=text name=email  class="w3-blue-grey w3-input"></td></tr>
<tr><td><strong >Date</strong></td><td><input type=text name=date id="datepicker" class="w3-blue-grey w3-input" ></td><td><strong>Shift</strong></td><td>
<select  class="w3-blue-grey w3-input" name=shift onblur="gettime()" id=shift>
<option value=morning>morning</option>
<option value=afternoon>afternoon</option>
<option value=evening>evening</option>
</select></td></tr>
<tr><td><strong>From</strong></td><td><select class="w3-blue-grey w3-input" name=from id=from></select></td><td><strong>To</strong></td><td><select class="w3-blue-grey w3-input" id=to name=to></select></td></tr>
<tr><td><img src=logos/wash.png class="logos" ></td><td><strong>washing machine</strong><br><br><select class="w3-blue-grey w3-input" name=wm><option value=0>OFF</option><option value=1>ON</option></select></td>
	<td><img src=logos/bowl.png class="logos" ></td><td><strong>Bowl washer</strong><br><br><select class="w3-blue-grey w3-input" name=bw><option value=0>OFF</option><option value=1>ON</option></select></td></tr>
<tr><td><img src=logos/thread.png class="logos" ></td><td><strong>Thread Mill</strong><br><br><select class="w3-blue-grey w3-input" name=tm><option value=0>OFF</option><option value=1>ON</option></select></td>
	<td><img src=logos/mat3.jpg class="logos" ></td><td><strong>YogaMat</strong><br><br><select class="w3-blue-grey w3-input" name=mat><option value=0>OFF</option><option value=1>ON</option></select></td></tr>
<tr><td><img src=logos/micro.png class="logos" ></td><td><strong>Microwave Oven</strong><br><br><select class="w3-blue-grey w3-input" name=mo><option value=0>OFF</option><option value=1>ON</option></select></td>
	<td><img src=logos/nesp.png class="logos" ></td><td><strong>Nespresso</strong><br><br><select class="w3-blue-grey w3-input"  name=nes><option value=0>OFF</option><option value=1>ON</option></select></td></tr>
<tr><td><img src=logos/tv.png class="logos" ></td><td><strong>TV</strong><br><br><select class="w3-blue-grey w3-input" name=tv><option value=0>OFF</option><option value=1>ON</option></select></td>
	<td><img src=logos/lap.png class="logos" ></td><td><strong>Laptop</strong><br><br><select class="w3-blue-grey w3-input"  name=lap><option value=0>OFF</option><option value=1>ON</option></select></td></tr>
<tr><td></td><td><input type=submit class="w3-button w3-blue" style="width: 100%"></td><td></td><td><input type=reset class="w3-button w3-red" style="width: 100%"></td></tr>
</table></form>
</center>
</body>
</html>