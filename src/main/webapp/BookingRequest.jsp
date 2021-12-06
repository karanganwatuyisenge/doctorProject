<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
table, th, td {
  border: 1px solid black;
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
	response.sendRedirect("DoctorLogin.jsp");
	}
%>
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
<div class="titles"><center><h4>View Booking Request</h4></center></div>
<table  width="100%" >
<tr border="2">
<%

//String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "appintment";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;


//rs.setBlob("img")
%>
<table>

<tr border="2">
<th> Patient_firstname</th>
<th> Patient_lastname</th>
<th> Location</th>
<th> Age</th>
<th> Gender</th>
<th> Date</th>
<th> Problem</th>
<th> Accept</th>



</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from patient_table";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("location") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("date") %></td>




</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</tr>
</table>
<div class="footer">
  <p><h4>Designed by us</h4></p>
</div>
</body>
</html>