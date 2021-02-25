<!-- 
	To show the appointment form to the patient
	Require two cookies - pname and pmobile
 -->

<%@page import="com.doc.JDBCHelper"%>
<%@page import="com.doc.Cookie"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Appointment</title>
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
input,select{
-webkit-box-shadow: 0 8px 6px -6px #aaa;
	   -moz-box-shadow: 0 8px 6px -6px #aaa;
	        box-shadow: 0 8px 6px -6px #aaa;
border: none;
height:25px;
width: 50%;
border-bottom: 1px solid #eee;
margin: 10px;
width: 50%;
transition: width 1s;
text-align: center;
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
select:enabled{
outline: none;
}
input[type = submit]:focus {
border: none;
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
input:focus, select:focus {
outline-style: none;
background-color: #fff;
border-bottom: 1px solid blue;
width: 80%;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js">
</script>
<script>
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var minDate= year + '-' + month + '-' + day;
    
    $('#date').attr('min', minDate);
});
</script>
</head>
<body>
	<script src="js/appointment.js" type="text/javascript"></script>
<img alt="img" src="https://www.graphicsprings.com/filestorage/stencils/860fd685a429f4b8aca1357d07297d79.png?width=500&height=500">
<center>
	<%
	/*
	 *To validate the patient name and mobile number cookies
	 */
	String pname = Cookie.get(request, "pname");
	String pmobile = Cookie.get(request, "pmobile");
	if (pname == null || pname.isEmpty() || pmobile == null || pmobile.isEmpty()) {
		System.out.println("\nInvalid attempt to access appointment.jsp -- Redirecting to login.jsp");
		response.sendRedirect("login.jsp");
	} else {

		//To display the form that contains Doctor name and Date fields
		out.print("<form action=bookAppointment.jsp onsubmit='return validatePatientForm()' method=POST >");
		out.print("<h3>Get Appointment:</h3>");
		out.print("&emsp;<select id=doc name=doc >");
		out.print("<option selected value='' >Select Doctor</option>");

		/*
		 * Retreiving Doctor names from database
		 */
		List<String> list = JDBCHelper.getAllDoctors();

		if (list.size() != 0) {
			Iterator<String> i = list.iterator();

			while (i.hasNext()) {
		String name = i.next();

		//To add options to the <select> tag
		out.print("<option value=\"" + name + "\">" + name + "</option>");
			}
			out.print("</select><br><span id=doc_req style='color: red; font-size: 12px; display: none;'>&nbsp;*required</span>");
		}

		//Date input field
		out.print("<br><div>Select Date:</div>&emsp;");
		out.print("&emsp;<br><input type=date id=date name=date ><br><div id=date_req style='color: red;font-size: 12px; display: none;'>&nbsp;*required</div>");
		out.print("<br><input type=submit value='Book Appointment'>");
	}
	%>
</center>	
</body>
</html>