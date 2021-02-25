<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Appointment"%>
<%@ page import="com.doc.Cookie"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

	<script type="text/javascript" src="js/Dashboard.js"></script>
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
.form{
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
border-bottom: 1px solid #eee;
transition: width 1s;
}
button {
-webkit-box-shadow: 0 8px 6px -6px #aaa;
	   -moz-box-shadow: 0 8px 6px -6px #aaa;
	        box-shadow: 0 8px 6px -6px #aaa;
border: none;
height:25px;
width: 50%;
border-radius: 5px;
border-bottom: 1px solid #eee;
cursor:  pointer;
transition: background-color 1s;
}
button:focus {
outline: none;
}
button:hover{

background-color: #fff;
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
h2,h3{
background-color: #eee;
border-radius: 8px;
-webkit-box-shadow: 0 8px 6px -6px #aaa;
	   -moz-box-shadow: 0 8px 6px -6px #aaa;
	        box-shadow: 0 8px 6px -6px #aaa;
padding: 5px;	        
}
</style>
</head>
<body onload=search() >

<img alt="img" src="https://www.graphicsprings.com/filestorage/stencils/860fd685a429f4b8aca1357d07297d79.png?width=500&height=500">
<center>
<div class="form">
	<%
	if (Cookie.list(request, "Dashboard.jsp") <= 1) {
		System.out.println("\nInvalid attempt to access Dashboard.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {

		String dname = Cookie.get(request, "dname");
		if (dname != null) {

			//welcome text
			out.print("<h2>Welcome Dr." + dname + "</h2>");
			out.print("<a href=logout.jsp >Logout</a><br>");

			out.print("<br>Search: <input type=date id=search_date ><br>");
			out.print("<br><button onclick=search() >Search</button><br>");
			out.println("<h3>Appointments:</h3>");

			out.println("<div id=list >Please wait....</div>");

		} else if (Cookie.get(request, "pname") != null) {
			response.sendRedirect("appointment.jsp");
		} else {
			System.out.println("\nInvalid attempt to access Dashboard.jsp -- Redirecting to login.jsp");
			response.sendRedirect("login.jsp");
		}
	}
	%>
</div>	
</center>	
</body>
</html>