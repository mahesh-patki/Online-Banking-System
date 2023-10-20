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
</head>
<body>
<% String account=request.getParameter("accno");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
PreparedStatement  pr=con.prepareStatement("Select * from customer_data where account_no=?");
pr.setLong(1,Long.parseLong(account));
ResultSet rs=pr.executeQuery();

%>
<table cellspacing=0px cellpadding=2px border=2px >
<th>ID</th>
<th>Name</th>
<th>account_no</th>
<th>pincode</th>
<th>Balance</th>
<% while(rs.next())
{%>
<tr>
<td><%= rs.getInt(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getLong(3) %></td>
<td><%= rs.getInt(4) %></td>
<td><%= rs.getInt(5) %></td>

</tr>
<%}%>

</table>

</body>
</html>