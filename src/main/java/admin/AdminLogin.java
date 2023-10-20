package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
	   PreparedStatement pr=con.prepareStatement("Select * from admin_data where email=? and password=?");
	   pr.setString(1,email);
	   pr.setString(2,password);
	   
	 ResultSet rs=pr.executeQuery();
	 PrintWriter print=resp.getWriter();
	 if(rs.next()) {
		 resp.setContentType("text/html");
		 print.println("login successfull");
		 RequestDispatcher rd=req.getRequestDispatcher("AdminOptions.html");
		 rd.include(req, resp);
		
	 }
	 else {
		 print.println("invalid Credential..");
		 RequestDispatcher rd=req.getRequestDispatcher("login.html");
		 rd.include(req, resp);
		 resp.setContentType("text/html");
	 }
	   
	 
		
	} 
	catch (ClassNotFoundException e) {
		e.printStackTrace();		}
	catch (SQLException e) {
		e.printStackTrace();
	}
		
	}
}
