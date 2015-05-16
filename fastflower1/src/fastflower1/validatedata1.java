package fastflower1;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/validatedata1")
public class validatedata1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public validatedata1() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			connection con= new connection();
			Statement st=con.getcon().createStatement();
			st.executeUpdate("INSERT INTO password VALUES('"+request.getParameter("email")+"','"+request.getParameter("pswd")+"','customer')");	
			st.executeUpdate("INSERT INTO customer VALUES('"+request.getParameter("email")+"','"+request.getParameter("fname")+"','"+request.getParameter("mname")+"','"+request.getParameter("lname")+"','"+request.getParameter("nic")+"','"+request.getParameter("aLine1")+"','"+request.getParameter("aLine2")+" ')");
			st.executeUpdate("INSERT INTO contact VALUES('"+request.getParameter("email")+"',"+request.getParameter("phone")+")");	
			response.sendRedirect("login/login.html");
		} catch (SQLException e) {
			System.out.println("Error connection");
		}
		
		
		
	}

}
