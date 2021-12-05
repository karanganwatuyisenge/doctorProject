<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
 background-color:#4080bf;
  color: white;
  text-align: center;
}


</style>
<meta charset="ISO-8859-1">
<title>online vote</title>
</head>
<body style="background: rgb(236, 242, 249);">
<%
response.setHeader("cache-control","no-cahe,no-store,must-revalidate");
response.setHeader("Progma","no-cache");
response.setHeader("Expires","0");

if(session.getAttribute("username")==null)
{
	response.sendRedirect("LoginPatient.jsp");
	}
%>
Dear ${username},welcome to secure page.......<br>
<div class="header">
<div class="title">Online Appointment Doctor</div>
<div class="menu">
<ul>
<li><a href="PatientHomepage.jsp">Home</a></li>
<li><a href="SearchDoctor.jsp">Search Doctor</a></li>
<li><a href="Feedback.jsp">Feedback</a></li>

<li>
<form action="LogoutDoctorServlet" method="POST">
<input type="submit" value="Logout">
</form>
</li>
</ul>
</div>
</div>

<div class="footer">
  <p><h4>Designed by Group 10</h4></p>
</div>
</body>
</html>