package fastflower1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fastflower")
public class fastflower extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public fastflower() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		try {
			
			Statement st=connection.getcon().createStatement();
			
			st.executeUpdate("INSERT INTO password VALUES('"+request.getParameter("email")+"','"+request.getParameter("pswd")+"','customer')");	
			st.executeUpdate("INSERT INTO customer VALUES('"+request.getParameter("email")+"','"+request.getParameter("fname")+"','"+request.getParameter("mname")+"','"+request.getParameter("lname")+"','"+request.getParameter("nic")+"','"+request.getParameter("aLine1")+"','"+request.getParameter("aLine2")+" ')");
			st.executeUpdate("INSERT INTO contact VALUES('"+request.getParameter("email")+"',"+request.getParameter("phone")+")");
			
			response.sendRedirect("signin/signin.jsp");
		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}
