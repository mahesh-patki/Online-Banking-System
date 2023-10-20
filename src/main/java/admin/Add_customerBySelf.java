package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/customerform1")
public class Add_customerBySelf extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name=req.getParameter("name");
		String pincode=req.getParameter("pin");
		String balance=req.getParameter("balance");
		
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system","root","Mahesh123#");
			 PreparedStatement ps=con.prepareStatement("Select * from customer_data where id=? ");
			 Random ran=new Random();
			 int id1=ran.nextInt(10000);
		     ps.setInt(1,id1);
			 ResultSet rs=ps.executeQuery();
			  PrintWriter pw=resp.getWriter();
			
			long account= ran.nextLong(100000);
			  if(rs.next())
				{		
				resp.setContentType("text/html");
				pw.println("Id is already existed");
				RequestDispatcher rd=req.getRequestDispatcher("add_customer.html");
			    rd.include(req, resp);
				}
			  else {
			PreparedStatement pr=con.prepareStatement("insert into customer_data(id,name,account_no,pincode,balance)value(?,?,?,?,?)");
			pr.setInt(1,id1);
			pr.setString(2, name);
			pr.setLong(3,account);
			pr.setInt(4,Integer.parseInt(pincode));
			pr.setDouble(5,Double.parseDouble(balance));
			pr.execute();
			
			resp.setContentType("text/html");
			pw.println("<h1>Customer Added Successfully</h1>");
			RequestDispatcher rd=req.getRequestDispatcher("Customer_Login.html");
		    rd.include(req, resp);
			
			
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

