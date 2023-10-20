<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Execute"%>
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
String name=request.getParameter("name");
String pin=request.getParameter("pin");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
PreparedStatement  pr=con.prepareStatement("Select * from customer_data where id=?");
pr.setInt(1,id);
ResultSet rs=pr.executeQuery();
if(rs.next())
{
	PreparedStatement  ps=con.prepareStatement("update customer_data set name=?,pincode=? where id=? ");
	ps.setString(1, name);
	ps.setInt(2,Integer.parseInt(pin));
	
	ps.setInt(3,id);
	ps.execute();
	
	 RequestDispatcher rd=request.getRequestDispatcher("FetchAndDisplay1.jsp");
	 out.print("Data updated successfully");
	  rd.include(request, response);
}
else {
	out.print("Customer is not present");
}
%>
<%
%>
<br>
<a href=Customer_Options.html>Back to main menu</a>
</body>
</html>