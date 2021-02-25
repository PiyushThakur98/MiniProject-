<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Signup</title>
<style type="text/css">
body {
	background-image:url("https://img.freepik.com/free-photo/blur-hospital_1203-7972.jpg?size=626&ext=jpg");
	height: 100vh;
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
width: 80%;
border-bottom: 1px solid #eee;
width: 50%;
transition: width 1s;
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
<img alt="img" src="https://www.graphicsprings.com/filestorage/stencils/860fd685a429f4b8aca1357d07297d79.png?width=500&height=500">

	<script type="text/javascript" src="js/signup.js"></script>
<center>
	<form action=createDoctor.jsp id=form onsubmit="return validateSignupForm()"
		method=POST>
		<h3>Doctor Signup Form </h3>
		<input type=text id=dname name=dname placeholder="User Name" ><br>
		<div id=dname_req style="color: red;font-size: 12px; display: none;">*Username
			is required</div><br>
		<input type=password id=dpassword name=dpassword placeholder="Password"><br>
		<div id=dpass_req style="color: red;font-size: 12px; display: none;">*Password
			is required</div><br>
		<input type=text id=name name=name placeholder="Name"><br>
		<div id=name_req style="color: red;font-size: 12px; display: none;">*Name is
			required</div><br>
		<input type=submit value=Signup><br><br>
		<a href="login.jsp">Already Registered?</a>
	</form>
</center>
</body>
</html>