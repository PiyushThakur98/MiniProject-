<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.doc.JDBCHelper"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invalid Page</title>
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
</style>
</head>
<body>
<img alt="img" src="https://www.graphicsprings.com/filestorage/stencils/860fd685a429f4b8aca1357d07297d79.png?width=500&height=500">

	<%
	String dname = request.getParameter("doctor");
	if (dname != null || !dname.isEmpty()) {

		//0 - Not found, 1 - Found
		int flag = 0;
		List<String> list = JDBCHelper.getAllDoctors();

		if (list != null) {
			Iterator<String> i = list.iterator();
			while (i.hasNext()) {
		String name = i.next();
		if (name.equals(dname)) {
			System.out.println("Exists: " + name);
			flag = 1;
		}
			}
		}

		if (flag == 1) {
			out.print("exists");
		} else {
			out.print("not exists");
		}
	} else {
		System.out.println("\nInvalid attempt to access checkDoctorAccount.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	}
	%>


</body>
</html>