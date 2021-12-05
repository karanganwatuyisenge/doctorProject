<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*"%>
   <%@ page import="java.util.Base64"%>
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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">


<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>WGSBS</title>

</head>
<body style="background: rgb(236, 242, 249);">

<div class="header">
<div class="title">Online Appointment Doctor</div>
<div class="menu">
<ul>
<li><a href="Homepage.jsp">Home</a></li>
<li><a href="DoctorLogin.jsp">Doctor</a></li>
<li><a href="LoginPatient.jsp">Patient</a></li>
<li><a href="Login.jsp">Admin</a></li>
<li>
<form action="Logout" method="POST">

</form>
</li>
</ul>
</div>
</div>
<div
  id="carouselMultiItemExample"
  class="carousel slide carousel-dark text-center"
  data-mdb-ride="carousel"
>
  <!-- Controls -->

  <!-- Carousel wrapper -->
<div
  id="carouselMultiItemExample"
  class="carousel slide carousel-dark text-center"
  data-mdb-ride="carousel"
>
  <!-- Controls -->

  <!-- Inner -->
 
  <div class="carousel-inner py-4">
    <!-- Single item -->
   
 
   
    <div class="carousel-item active">
      <div class="container">
        <div class="row">
                                    
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
                       <table>
                       <tr>
                      <div class="card-body" style= "position:absolute;inline-block;left:100px;">

                                        
                                           <td>  <img src="data:image/jpg;base64,<%=base64Image%>" width="350" height="300" /> </td>
                                      <% } %>
                                      
                                      </div>
                                        </tr>
</div>

 </table>                                      
</div>

</div>
<div class="footer"></div>
</body>
</html>