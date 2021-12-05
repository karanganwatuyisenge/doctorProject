<%@page import="java.util.*;"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Search Doctor</title>

</head>
<body>
<table align="center">

<%

List bookdoctor=new ArrayList();

bookdoctor=(ArrayList)request.getAttribute("department");

if(bookdoctor!=null && bookdoctor.size()>0 ){

%>

<h2 align="center">Book Doctor</h2>

<tr>

<th>Doctor First Name</th>
<th>Doctor Last Name</th>
<th>Phone number</th>
<th>Email</th>
<th>Location</th>
<th>Book</th>

</tr>

<%

for(int i=0;i<bookdoctor.size();i++){

List book=(List)bookdoctor.get(i);

%>
<tr>

<td><%=book.get(1) %></td>

<td><%=book.get(2) %></td>

<td><%=book.get(3) %></td>
<td><%=book.get(4) %></td>
<td><%=book.get(5) %></td>
<td><%=book.get(6) %></td>

</tr>

<%

}

}else{

%>

Not  Available  Any Book Details

<%}%>



</table>
</body>

</html>