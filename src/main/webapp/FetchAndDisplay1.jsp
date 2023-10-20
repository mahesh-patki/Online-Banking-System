<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th{
color: white
}</style>
</head>
<body bgcolor="gray">
<%
int id=(Integer)session.getAttribute("id");
System.out.println(id);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
PreparedStatement pr=con.prepareStatement("Select * from customer_data where id=?");
pr.setInt(1,id);
ResultSet rs= pr.executeQuery();
%>

<table cellPadding="20px" border="2">
<th>Id</th>
<th>Name</th>
<th>Account_no</th>
<th>Pincode</th>
<th>Balance</th>
<% while(rs.next()){ %>
<tr>
<td><%= rs.getInt(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getLong(3) %></td>
<td><%= rs.getInt(4) %></td>
<td><%= rs.getInt(5) %></td>
<%} %>
</table>
</body>
</html>