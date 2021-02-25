<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Doctor"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Doctor</title>
<style type="text/css">
body {
	background-image:url("https://img.freepik.com/free-photo/blur-hospital_1203-7972.jpg?size=626&ext=jpg");
	height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative; 
	font-family: Monaco, Helvetica, sans-serif;  
	text-align: center;
}
img{
height: 100px;
width: 100px;
position: relative;
top: 20%;
}
a{
text-decoration: none;
color: red;
cursor: pointer;
position: relative;
top: 20%;
font-size: 20px;
transition: background-color 0.5s;
background-color: transparent;
padding: 5px;
border-radius: 5px;
opacity: 0.8;
}
a:hover{
background-color: #fff;
padding: 5px;
border-radius: 5px;
opacity: 0.8;
}
h3{
position: relative;
top: 20%;
}
</style>
</head>
<body>
<img alt="img" src="https://www.graphicsprings.com/filestorage/stencils/860fd685a429f4b8aca1357d07297d79.png?width=500&height=500">

	<%
	String dname = request.getParameter("dname");
	String dpass = request.getParameter("dpassword");
	String name = request.getParameter("name");

	if (dname == null || dname.isEmpty() || dpass == null || dpass.isEmpty() || name == null || name.isEmpty()) {
		System.out.println("\nInvalid attempt to access createDoctor.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {

		Doctor doctor = new Doctor(dname, dpass, name);

		if (JDBCHelper.insertDoctor(doctor)) {
			out.write("<h3>Account created Successfully!</h3>");
			out.write("<br><a href=login.jsp >Login...</a>");
		} else {
			out.write("<h3>Failed to signup! Please try again!</h3>");
			out.write("<br><a href=signup.jsp >Signup...</a>");
		}

	}
	%>

</body>
</html>