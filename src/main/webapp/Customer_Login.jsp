<%@page import="java.io.PrintWriter"%>
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
	String id2 = request.getParameter("id");
	String pin = request.getParameter("pin");
    
	int  id1 = Integer.parseInt(id2);
	int  pin1=Integer.parseInt(pin);
	session.setAttribute("id", id1);


	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "root", "Mahesh123#");
	PreparedStatement pr = con.prepareStatement("Select * from customer_data where id=? and pincode=?");
	pr.setInt(1,id1);
	pr.setInt(2, Integer.parseInt(pin));
	ResultSet rs = pr.executeQuery();
			
	if (rs.next()) {
		String name=rs.getString("name");
		session.setAttribute("name", name);
		session.setAttribute("pin", pin1);
		PrintWriter print = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("Customer_Options.html");
		response.setContentType("text/html");
		print.print("Login Successfully..!");
		rd.include(request, response);
	} else {
		PrintWriter print = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("Customer_Login.html");
		print.print("Invalid Credintials..!");
		rd.include(request, response);
		response.setContentType("text/html");
	}
	%>
</body>
</html>