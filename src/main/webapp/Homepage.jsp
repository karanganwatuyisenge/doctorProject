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
<li><a href="PatientRegister.jsp">Patient</a></li>
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