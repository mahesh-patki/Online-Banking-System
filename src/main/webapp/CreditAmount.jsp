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
int id=(Integer)session.getAttribute("id");

String amount=request.getParameter("amount");
int amount1=Integer.parseInt(amount);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "root", "Mahesh123#");
PreparedStatement pr = con.prepareStatement("Select balance from customer_data where id=? ");
pr.setInt(1,id);
ResultSet rs=pr.executeQuery();
rs.next();
int balance=rs.getInt("balance");
int newBalance=amount1+balance;

PreparedStatement ps = con.prepareStatement("update customer_data set balance=? where id=? ");
ps.setInt(1,newBalance);
ps.setInt(2,id);
ps.execute();

%>
<%
out.print("Balance Credited Successfully ...!");

%>

</body>
</html>