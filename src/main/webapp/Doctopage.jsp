<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
   <%@ page import="java.util.Base64"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");
String username = request.getParameter("username"); 
String dburl="jdbc:mysql://localhost:3306/appintment";
 String dbuser="root";
 String dbpassword="";
Connection connection = DriverManager.getConnection(dburl,dbuser,dbpassword);
        Statement statement = connection.createStatement() ;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>online doctor appointment</title>
</head>

<body>
<%
response.setHeader("cache-control","no-cahe,no-store,must-revalidate");
response.setHeader("Progma","no-cache");
response.setHeader("Expires","0");

if(session.getAttribute("username")==null)
{
	response.sendRedirect("Homepage.jsp");
	}
%>
<div class="header">
<div class="title">Online Appointment Doctor</div>
<div class="menu">
<ul>
<li><a href="Doctopage.jsp">Home</a></li>
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
</body>
</html>
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

section {
   background-image: url(doc66554.jpg);
   padding: 15px;
   width: 100%;
   height: 700px;
}
</style>