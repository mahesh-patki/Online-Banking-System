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
<%
String id=request.getParameter("id");


Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
PreparedStatement  pr=con.prepareStatement("Delete from customer_data where id=?");
pr.setInt(1,Integer.parseInt(id));
pr.execute();
%>
<% 
RequestDispatcher rd=request.getRequestDispatcher("DisplayAllCustomer.jsp");
out.print("Data is Deleted Successfully...!");
rd.include(request, response);
%>

</body>
</html>