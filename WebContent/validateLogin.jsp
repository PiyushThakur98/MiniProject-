<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="com.doc.Cookie"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid Request</title>
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
	String type = request.getParameter("type");
	
	if(type == null || type == ""){
		System.out.println("\nInvalid attempt to access vaidateLogin.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	}else{
		
		//Check if doctor trying to login
		if(type.equals("doctor")){
			
			Cookie.delete(response, request, "validateLogin.jsp");

			String dname = request.getParameter("dname");
			String dpass = request.getParameter("dpass");
			
			if(dname == null || dname == "" || dpass == null || dpass == ""){
				System.out.println("Dname: " + dname + "\t Dpass: " + dpass);
				System.out.println("\nInvalid attempt to access vaidateLogin.jsp -- Redirecting to login.jsp");
				response.sendRedirect("login.jsp");
			}else{
				
				//validate doctor name and password
				if(JDBCHelper.getDoctor(dname, dpass)){
					
					//create cookie of doctor
					Cookie.create(response, "dname", dname, "validateLogin.jsp");
					
					//redirect to dashboard
					response.sendRedirect("Dashboard.jsp");
				}else{
					out.print("<h3>Invalid credentials! Please try again...</h3><br><a href=login.jsp >Return to login page</a>");
					
				}
				
			}
		}else if(type.equals("patient")){ //Check if patient tying to login

			Cookie.delete(response, request, "validateLogin.jsp");
			
			String pname = request.getParameter("pname");
			String pmobile = request.getParameter("pmobile");
			
			if(pname == null || pname == "" || pmobile == null || pmobile == ""){
				System.out.println("Pname: " + pname + "\t Pmobile: " + pmobile);
				System.out.println("\nInvalid attempt to access validateLogin.jsp -- Redirecting to login.jsp");
				response.sendRedirect("login.jsp");
			}else{

				//create cookie of patient
				Cookie.create(response, "pname", pname, "validateLogin.jsp");
				Cookie.create(response, "pmobile", pmobile, "validateLogin.jsp");
				
				//redirect to appointment page
				response.sendRedirect("appointment.jsp");
				
			}
		}else{
			System.out.println("\nInvalid attempt to access validateLogin.jsp -- Redirecting to login.jsp");
			response.sendRedirect("login.jsp");
		}
	}

	%>

</body>
</html>