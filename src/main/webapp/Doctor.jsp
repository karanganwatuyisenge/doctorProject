<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins',sans-serif;
}
body{
  height: 150vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background:rgb(224, 235, 235);
}
.container{
  max-width: 700px;
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
.user-details .input-box input:focus,
.user-details .input-box input:valid{
  border-color: #9b59b6;
}
 form .gender-details .gender-title{
  font-size: 20px;
  font-weight: 500;
 }
 form .category{
   display: flex;
   width: 80%;
   margin: 14px 0 ;
   justify-content: space-between;
 }
 form .category label{
   display: flex;
   align-items: center;
   cursor: pointer;
 }
 form .category label .dot{
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #d9d9d9;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
 #dot-1:checked ~ .category label .one,
 #dot-2:checked ~ .category label .two,
 #dot-3:checked ~ .category label .three{
   background: #9b59b6;
   border-color: #d9d9d9;
 }
 form input[type="radio"]{
   display: none;
 }
 form .button{
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: rgb(45, 45, 134);
 }
 form .button input:hover{
  /* transform: scale(0.99); */
  background: rgb(45, 45, 134);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }
  form .category{
    width: 100%;
  }
  .content form .user-details{
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar{
    width: 5px;
  }
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}

</style>
<head>
    <meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  
  <div class="container">
    <div class="title">Doctor Registration</div>
    <div class="content">
      <form action="TextServlet" method="POST" enctype="multipart/form-data">
        <div class="user-details">
          <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" placeholder="First Name" name="firstname"  required>
<br>
          </div>
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" placeholder="Last Name" name="lastname" required>
          </div>
          <div class="input-box">
            <span class="details">Phone</span>
            <input type="text" placeholder="Enter your phone" name="phone"  required>
          </div>
          <div class="input-box">
            <span class="details">Nationality</span>
            <input type="text" placeholder="Enter your nationality" name="nationality"  required>
          </div>
            <div class="gender-details">
          <input type="radio" name="gender" id="dot-1" value="gender" required>
          <input type="radio" name="gender" id="dot-2" value="gender" required>
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender">Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Female</span>
          </label>
          </div>
        </div>
        <div class="input-box">
         <span class="details">Title</span>
        <select name="title"  >
        <option>Bachelor Degree in dental</option>
        <option>Bachelor Degree in medecine</option>
        <option>Bachelor Degree in pharmacy</option>
        <option>Bachelor Degree in general nursing</option>
        <option>PHD Degree in dental</option>
        <option>PHD Degree in medecine</option>
        <option>PHD Degree in pharmacy</option>
        <option>PHD Degree in general nursing</option>
        </select>
          </div>
          
          <div class="input-box">
         <span class="details">Department</span>
        <select name="department">
        <option>Anaesthetistics</option>
        <option>General Practitioners</option>
        <option>Intensive care medecine</option>
        <option>Obstretrics and gynaecology</option>
        <option>Occupational medecine</option>
        <option>Oncologists</option>
        <option>Paediatricians</option>
        <option>Pathology</option>
        <option>Physicians</option>
         <option>Public health specialist</option>
        <option>Surgeons</option>
        </select>
          </div>
          
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter email" name="email"  required>
          </div>
          <div class="input-box">
            <span class="details">Location</span>
            <input type="text" placeholder="Enter Your Location" name="location"  required>
          </div>
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" placeholder="Enter your username" name="username"  required>
          </div>
          <div class="input-box">
            <span class="details">password</span>
            <input type="password" placeholder="Enter your password" name="password"  required>
          </div>
          <div>
          <span >Picture</span>
          <input type="file" name="picture" >
          </div>
         
        </div>
      
        <div class="button">
          <input type="submit" value="Register Now" name="submit">
        </div>
        
      </form>
      <div><a href="Adminhome.jsp">Click here to go back</a></div>
    </div>
  </div>

</body>
</html>