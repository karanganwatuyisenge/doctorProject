<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/appintment";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("doctor_id");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String phone = request.getParameter("phone");
String nationality=request.getParameter("nationality");
String gender = request.getParameter("gender");
String title=request.getParameter("title");
String department = request.getParameter("department");
String email=request.getParameter("email");
String username = request.getParameter("username");
String password=request.getParameter("password");
String picture = request.getParameter("picture");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
	Class.forName(driverName);
	con = DriverManager.getConnection(url,user,psw);
	String sql="Update doctor_table set doctor_id=?,firstname=?,lastname=?,phone=?,nationality=?,gender=?,title=?,department=?,email=?,username=?,password=?,picture=? where doctor_id="+id;
	ps = con.prepareStatement(sql);
	ps.setString(1,id);
	ps.setString(2, firstname);
	ps.setString(3, lastname);
	ps.setString(4, phone);
	ps.setString(5,nationality);
	ps.setString(6, gender);
	ps.setString(7, title);
	ps.setString(8, department);
	ps.setString(9, email);
	ps.setString(10, username);
	ps.setString(11,password);
	ps.setString(12,picture);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("Record Updated Successfully");
	}
	else
	{
		out.print("There is a problem in updating Record.");
	}
	}
	catch(SQLException sql)
	{
	request.setAttribute("error", sql);
	out.println(sql);
	}
	}
	%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Well updated</h1>
</body>
</html>