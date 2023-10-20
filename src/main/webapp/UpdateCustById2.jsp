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
String name=(String)session.getAttribute("name");
String pin=(String)session.getAttribute("pin");
%>
<form action="UpdateCustById1.jsp">
<fieldset>
Name :<input type="text"  name="name" value="<%=name%>"><br>
Updated pin  :<input type="text" name="pin" value="<%=pin%>"><br>
<input type="submit">
</fieldset>
</form>

</body>
</html>