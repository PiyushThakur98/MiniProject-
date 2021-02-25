<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<style type="text/css">
body {
	background-image:url("https://img.freepik.com/free-photo/blur-hospital_1203-7972.jpg?size=626&ext=jpg");
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative; 
	font-family: Monaco, Helvetica, sans-serif;  
}
img{
height: 100px;
width: 100px;
margin-left: 30px;
}
#container{
text-align: center;
}
form{
background: #fff;
width:30%; 
cellpadding:15px;
border-radius: 10px;
box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
padding-bottom: 15px;
}
input{
-webkit-box-shadow: 0 8px 6px -6px #aaa;
	   -moz-box-shadow: 0 8px 6px -6px #aaa;
	        box-shadow: 0 8px 6px -6px #aaa;
border: none;
height:25px;
width: 50%;
transition: width 1s;
border-bottom: 1px solid #eee;
}
input[type = submit] {
-webkit-box-shadow: 0 8px 6px -6px #aaa;
	   -moz-box-shadow: 0 8px 6px -6px #aaa;
	        box-shadow: 0 8px 6px -6px #aaa;
border: none;
height:25px;
border-radius: 5px;
border-bottom: 1px solid #eee;
cursor:  pointer;
width: 50%;
transition: background-color 1s;

}
input[type = submit]:focus {
border: none;
background-color: #eee;
width: 50%;
}
input[type = submit]:hover {
background-color: #fff; 
width: 50%;
}
::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  text-align: center;
  color: black;
}
input:focus::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  text-align: center;
  color: #fff;
}
input:focus::-moz-placeholder { /* Firefox 19+ */
  text-align: center;
  color: black;
}
input:focus:-ms-input-placeholder { /* IE 10+ */
  text-align: center;
  color: black;
}
input:focus:-moz-placeholder { /* Firefox 18- */
  text-align: center;
  color: black;
}

input:focus{
outline-style: none;
background-color: #fff;
border-bottom: 1px solid blue;
width: 80%;
}
a{
text-decoration: none;
color: red;
cursor: pointer;
}
h3{
background-color: #eee;
border-radius: 8px;
-webkit-box-shadow: 0 8px 6px -6px #aaa;
	   -moz-box-shadow: 0 8px 6px -6px #aaa;
	        box-shadow: 0 8px 6px -6px #aaa;
padding: 5px;	        
}
</style>
</head>
<body>
	

	<script type="text/javascript" src="js/login.js"></script>

	<%
	if (Cookie.get(request, "dname") != null) {
		response.sendRedirect("Dashboard.jsp");
	}
	%>
<img alt="img" src="https://www.graphicsprings.com/filestorage/stencils/860fd685a429f4b8aca1357d07297d79.png?width=500&height=500">

	<!-- Doctor Login Form -->
	<div id=container >
	<div id=doc_form > 
	<center>
	<form action=validateLogin.jsp?type=doctor onsubmit="return validateDocLogin()" method=POST>
		<h3>Doctor's Login</h3>
		<input type=text name=dname id=dname placeholder="User Name"><br>
		<div id=dname_req style="color: red; font-size: 12px;"></div><br>
		<input type=password name=dpass id=dpass placeholder="Password">
		<div id=dpass_req style="color: red;font-size: 12px;"></div>
		<br>
		<input type=submit value=Login> 
		<br><br>
		<a href=signup.jsp>New Doctor?</a>
	</form>
	</center>
</div>
<br>
<div id=patient_form >
	<center>
	<!-- Patient Login Form -->
	<form action=validateLogin.jsp?type=patient
		onsubmit="return validatePatientLogin()" method=POST>
		<h3>Patient Login</h3>
		<input type=text name=pname id=pname placeholder="Patient Name"><br>
		<div id=pname_req style="color: red;font-size: 12px;"></div><br>
		<input type=number name=pmobile id=pmobile placeholder="Mobile Number">
		<div id=pmobile_req style="color: red;font-size: 12px;"></div>
		<br>
		<input type=submit value=Proceed>
	</form>
	</center>
	</div>
	</div>
</body>
</html>