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
table{
position:absolute;
width:1200px;
height:200px;
background-color:LightGray;
   border: 1px solid pink;
    border-top-left-radius: 100px;
    border-bottom-left-radius: 10px;
      border: 2px solid pink;
      padding-left:50px;
      margin-left:10px;   

}
</style>
<head>

<meta charset="ISO-8859-1">
  <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>

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
<div class="title">Welcome Admin</div>

<div class="menu">
<div class ="table"></div>
<ul>
<li><a href="Adminhome.jsp">Home</a></li>
<li><a href="ListOfAllDoctors.jsp">View Doctors</a></li>
<li><a href="ListOfAllPatient.jsp">View Patients</a></li>

<li><a href="Doctor.jsp">Doctors Registration</a></li>
<li><a href="Logout.jsp">Logout</a></li>

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
                            
                                            <td><img src="data:image/jpg;base64,<%=base64Image%>" width="100" height="50" />
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

<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5">
  <!-- Footer -->
  <footer class="text-center text-lg-start text-white"
          style="position:absolute;background-color: white;color:white;top:160%;left:0%;height:93%;width:97%;">
    <!-- Grid container -->
    <div class="container p-4 pb-0" style="background-color: #333333;width:104%;height:50%;top:0%;">
      <!-- Section: Links -->
      <section class="">
        <!--Grid row-->
        <div class="row">
          <!-- Grid column -->
          <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">
            online doctor appointment
            </h6>
            <p>
              you can request your appointment now
            </p>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">your appointment</h6>
           
            <p>
              <h4 class="text-white">run online </h4>
            </p>
           
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">
              Useful links
            </h6>
            <p>
              <h4 class="text-white">your Account</h4>
            </p>
            <p>
              <h4 class="text-white">quick application</h4>
            </p>
            <p>
              <h4 class="text-white">appointment date</h4>
            </p>
            <p>
              <h4 class="text-white">Help</h4>
            </p>
          </div>

          <!-- Grid column -->
          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">more information</h6>
            <p><i class="fas fa-home mr-3"></i>huye campus Butare</p>
            <p><i class="fas fa-envelope mr-3"></i> karanganwatuyisenge@gmail.com</p>
            <p><i class="fas fa-phone mr-3"></i> + 250 78564789</p>
            <p><i class="fas fa-print mr-3"></i> + 250 723456</p>
          </div>
          <!-- Grid column -->
        </div>
        <!--Grid row-->
      </section>
      <!-- Section: Links -->

      <hr class="my-3">

      <!-- Section: Copyright -->
      <section class="p-3 pt-0">
        <div class="row d-flex align-items-center">
          <!-- Grid column -->
          <div class="col-md-7 col-lg-8 text-center text-md-start">
            <!-- Copyright -->
            <div class="p-3">
              © 2022 Copyright #DONE GROUP 10:
              <a class="text-white" href="Homepage.jsp"
                 >MDBootstrap.com</a
                >
            </div>
            <!-- Copyright -->
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
            <!-- Facebook -->
            <a
               class="btn btn-outline-light btn-floating m-1"
               class="text-white"
               role="button"
               ><i class="fab fa-facebook-f"></i
              ></a>

            <!-- Twitter -->
            <a
               class="btn btn-outline-light btn-floating m-1"
               class="text-white"
               role="button"
               ><i class="fab fa-twitter"></i
              ></a>

            <!-- Google -->
            <a
               class="btn btn-outline-light btn-floating m-1"
               class="text-white"
               role="button"
               ><i class="fab fa-google"></i
              ></a>

            <!-- Instagram -->
            <a
               class="btn btn-outline-light btn-floating m-1"
               class="text-white"
               role="button"
               ><i class="fab fa-instagram"></i
              ></a>
          </div>
          <!-- Grid column -->
        </div>
      </section>
      <!-- Section: Copyright -->
    </div>
    <!-- Grid container -->
  </footer>
  <!-- Footer -->
</div>
<!-- End of .container -->
</div>
</body>
</html>