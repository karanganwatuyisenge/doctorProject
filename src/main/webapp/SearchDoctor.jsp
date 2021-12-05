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
<head>
<title>Search Doctor</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>
<body>
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
<div class="container">
<form class="form-inline" method="post" action="SearchDoctor1">
<td><select name="department">

<option value="-1">-Select Category-</option>

<option value="Bachelor Degree in dental">Bachelor Degree in dental</option>

<option value="Bachelor Degree in medecine">Bachelor Degree in medecine</option>

<option value="Bachelor Degree in pharmacy">Bachelor Degree in pharmacy</option>
        </select>
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>
</div>
</body>
</html>