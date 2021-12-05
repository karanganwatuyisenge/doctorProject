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
table, th, td {
  border: 1px solid black;
}

</style>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="header">
<div class="title">Welcome Admin</div>

<div class="menu">

<ul>
<li><a href="Adminhome.jsp">Home</a></li>
<li><a href="ListOfAllDoctors.jsp">View Doctors</a></li>
<li><a href="ListOfAllPatient.jsp">View Patients</a></li>
<li><a href="#">Patients Request</a></li>
<li><a href="Doctor.jsp">Doctors Registration</a></li>
<li><a href="#">Logout</a></li>

<li>
<form action="Logout" method="POST">

</form>
</li>
</ul>
</div>
</div>
<div class="titles"><center><h4>LIST OF ALL PATIENTS</h4></center></div>
<table  width="100%" >
<tr >
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

<tr >
<th> Patient Id</th>
<th> First Name</th>
<th> Last Name</th>
<th> Location</th>
<th> Age</th>
<th> Gender</th>
<th> Date</th>
<th> edit</th>
<th>delete</th>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from patient_table";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("patient_id") %></td>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("location") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("date") %></td>
<td><a href="UpdatePatient.jsp?id=<%=resultSet.getString("patient_id")%>">update</a></td>
<td><a href="DeletePatient.jsp?id=<%=resultSet.getString("patient_id")%>">delete</a></td>


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
</body>
</html>