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

  width:400px;
}
table

{
position:absolute;
width:1300px;
height:500px;
background-color:LightGray;
   border: 1px solid #bdbdbd;
    border-top-left-radius: 100px;
    border-bottom-left-radius: 0.25rem;
      border: 2px solid #9e9e9e;
      padding-left:50px;
      margin-left:20px;   
      
}

footer{
position:absolute;
width:100px;
height:30px;
background-color:black;
}
</style>
<head>
<meta charset="ISO-8859-1">
  <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
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
<div class="titles"><center><h4>LIST OF ALL PATIENTS</h4></center></div>
<div class "table">
<div class="footer"></div>
<table  width="100%"" >
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
<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5">
  <!-- Footer -->
  <footer
          class="text-center text-lg-start text-white"
          style="background-color: white;color:white;top:115%;left:-4%;width:100%;"
          >
    <!-- Grid container -->
    <div class="container p-4 pb-0" style="background-color: #333333;left:0%;width:104%;">
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