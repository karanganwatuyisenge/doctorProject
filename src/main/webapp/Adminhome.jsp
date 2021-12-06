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
<title>online Doctor Appointment</title>
</head>
<body style="background-image: rgb(236, 242, 249);">
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
<li><a href="Adminhome.jsp">Home</a></li>
<li><a href="ListOfAllDoctors.jsp">View Doctors</a></li>
<li><a href="ListOfAllPatient.jsp">View Patients</a></li>
<li><a href="Doctor.jsp">Doctors Registration</a></li>
<li><a href="Logout.jsp">Logout</a></li>


</ul>
</div>
</div>
<div><img src="images/medical-doctors-18148841.jpg" style="position:absolute;left:1px;"width="100%" height="100%"></div>
<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5">
  <!-- Footer -->
  <footer
          class="text-center text-lg-start text-white"
          style="position:absolute;background-color: white;color:white;top:100%;left:-4%;width:100%;"
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