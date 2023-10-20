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
	final int min_balance = 500;

	int id = (Integer)session.getAttribute("id");
	String amount = request.getParameter("amount");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "root", "Mahesh123#");
	PreparedStatement pr = con.prepareStatement("Select balance from customer_data where id=?  ");
	pr.setInt(1, id);
	ResultSet rs = pr.executeQuery();
	rs.next() ;
	int balance = rs.getInt("balance");
	if ((min_balance + Integer.parseInt(amount)) < balance) {
		out.print("Withdraw Successfull");
		out.newLine();
		out.print("your current balance is :" + (Integer.parseInt(amount) - balance));

	} else {
		out.print("insufficent Balance");

	}
	%>
</body>
</html>