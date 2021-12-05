<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.title
{
text-align:center;
font-size:50px;
font-family:Open Sans;
background: rgb(236, 242, 249);
padding:10px;
}
ul
{

list-style-type:none;
margin:0px;
padding-right:0px;
background-color:#4080bf;
overflow:hidden;
font-family: "Times New Roman", Verdana, Helvetica, sans-serif;
    font-size: 19px;
    left:35px;
}
li
{
float:left;
}
li a
{
padding:14px 18px;
display:block;
color:white;
text-decoration:none;
}
li a:hover
{
background-color:gray;
}
.header
{
margin-left:-10px;
margin-right:-10px;
}
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="header">
<div class="title">Online Appointment Doctor</div>
<div class="menu">
<ul>
<li><a href="Doctorspage.jsp">Home</a></li>
<li><a href="BookingRequest.jsp">Booking Request</a></li>
<li><a href="ViewFeedback.jsp">View Feedback</a></li>
<li>
<form action="LogoutDoctorServlet" method="POST">
<input type="submit" value="Logout">
</form>
</li>
</ul>
</div>
</div>
<div class="section">
<img src="images/istockphoto-1307543618-170667a.jpg" style="position:absolute;left:800px;"width="40%" height="70%">
<img src="images/872-8721949_best-doctor-team-good-doctor-medical-medical-doctor.png" width="50%" height="30%"></div>
</body>
</html>