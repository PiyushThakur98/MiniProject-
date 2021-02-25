<%@page import="com.doc.Cookie"%>
<%@page import="com.doc.JDBCHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid</title>
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
	String dname = request.getParameter("doc");
	String sdate = request.getParameter("date");

	if (dname == null || dname.isEmpty() || sdate == null || sdate.isEmpty()) {
		System.out.println("\nInvalid attempt to access bookAppointment.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {
		System.out.print("Doc: " + dname + " Date: " + sdate);

		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
		java.sql.Date sqldate = new java.sql.Date(date.getTime());
		String pname = null;
		String pmobile = null;

		if (Cookie.list(request, "bookAppointment.jsp") <= 2) {
			out.print("<h3>Please login!</h3><br><a href=login.jsp >Click here to login</a>");
		} else {
			pname = Cookie.get(request, "pname");
			pmobile = Cookie.get(request, "pmobile");

			if (pname != null && pmobile != null) {

		if (JDBCHelper.bookAppointment(dname, sqldate, pname, pmobile)) {
			out.println("<h3>Appointment booked on " + date.getDate() + "-" + (date.getMonth() + 1) + "-" + (date.getYear() + 1900)+"</h3>");
			out.print("<br><br><a href=login.jsp >Book Another Appointment Here</a>");
			Cookie.delete(response, request, "bookAppointment.jsp");
		} else {
			out.print("<h3>Failed to book appointment!</h3> <br> <a href=login.jsp >Please try again!</a>");
		}

			} else {
		out.print("<h3>Please login!</h3><br><a href=login.jsp >Click here to login</a>");
			}
		}
	}
	%>

</body>
</html>