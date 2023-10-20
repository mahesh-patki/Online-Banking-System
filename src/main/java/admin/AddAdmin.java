package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Resultset;


@WebServlet("/form")
public class AddAdmin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	 {   
		Random ran=new Random();
		int id1=ran.nextInt(10000);
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
			PreparedStatement ps=con.prepareStatement("Select * from admin_data where id=? ");
			
		     ps.setInt(1,id1);
			 ResultSet rs=ps.executeQuery();
			  PrintWriter pw=resp.getWriter();
			if(rs.next())
			{		
			resp.setContentType("text/html");
			pw.println("Id is already existed");
			RequestDispatcher rd=req.getRequestDispatcher("adminLogin.html");
		    rd.include(req, resp);
			}
			else {
				 PreparedStatement pr=con.prepareStatement("insert into admin_data(id,name,email,password) values(?,?,?,?)");
				   pr.setInt(1, id1);
				   pr.setString(2,name);
				   pr.setString(3,email);
				   pr.setString(4,password);
				 
				   pr.execute();

					RequestDispatcher rd=req.getRequestDispatcher("adminLogin.html");
					rd.include(req, resp);
					pw.print("admin Added successfully...!");
					 
			}
		 
			
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		 
	}

	
}
