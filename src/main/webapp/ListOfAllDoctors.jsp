<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
   <%@ page import="java.util.Base64"%>
   <%@page import="java.sql.DriverManager"%>

<% Class.forName("com.mysql.cj.jdbc.Driver");
 String dburl="jdbc:mysql://localhost:3306/appintment";
 String dbuser="root";
 String dbpassword="";
Connection connection = DriverManager.getConnection(dburl,dbuser,dbpassword);
        Statement statement = connection.createStatement() ;
%>

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
 <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
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
<div class="titles"><center><h4>LIST OF ALL DOCTORS</h4></center></div>
<div class="table-responsive"></div>
<table  class="table">
  <thead>
    <tr>
      <th scope="col">Doctor Id</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Phone</th>
       <th scope="col">Nationality</th>
      <th scope="col">Gender</th>
       <th scope="col">Title</th>
      <th scope="col">Department</th>
       <th scope="col">Email</th>
      <th scope="col">Location</th>
       <th scope="col">Username</th>
      <th scope="col">Picture</th>
       <th scope="col">Edit</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
 <%
                     /*   String dbDriver="com.mysql.cj.jdbc.Driver";
                       Databaseconnection dbc = new Databaseconnection();
    		dbc.loadDriver(dbDriver);
    	Connection con = dbc.getConnection(); */
    	
    	ResultSet resultsetBooks = statement.executeQuery("SELECT * FROM `doctor_table`") ;
    	   while(resultsetBooks.next()){
    		   Blob blob = resultsetBooks.getBlob("picture");
    		   
    		   InputStream inputStream = blob.getBinaryStream();
    		   ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    		   byte[] buffer = new byte[4096];
    		   int bytesRead = -1;
    		    
    		   while ((bytesRead = inputStream.read(buffer)) != -1) {
    		       outputStream.write(buffer, 0, bytesRead);
    		   }
    		    
    		   byte[] imageBytes = outputStream.toByteArray();
    		    
    		   String base64Image = Base64.getEncoder().encodeToString(imageBytes);
    		    
    		   inputStream.close();
    		   outputStream.close();
                       %>
                       <tbody>
    <tr class="table-info">


                               <td><%= resultsetBooks.getString(1)  %></td>
                               <td><%= resultsetBooks.getString(2)  %></td>
                               <td><%= resultsetBooks.getString(3)  %></td>
                               <td><%= resultsetBooks.getString(4)  %></td>
                               <td><%= resultsetBooks.getString(5)  %></td>
                               <td><%= resultsetBooks.getString(6)  %></td>
                               <td><%= resultsetBooks.getString(7)  %></td>
                               <td><%= resultsetBooks.getString(8)  %></td>
                               <td><%= resultsetBooks.getString(9)  %></td>
                               <td><%= resultsetBooks.getString(10)  %></td>
                               <td><%= resultsetBooks.getString(11)  %></td>
                            
                                            <td><img src="data:image/jpg;base64,<%=base64Image%>" width="100" height="140" />
                                             </td>
                                         
                                          
                                          
                                             </td>
                                         
<td><a href="UpdateDoctor.jsp?id=<%=resultsetBooks.getString(1)%>">update</a></td>
<td><a href="DeleteDoctor.jsp?id=<%=resultsetBooks.getString(1)%>">delete</a></td>

</tr>
 <% } %>

</tr>
</tbody>
</table>
</div>
</body>
</html>