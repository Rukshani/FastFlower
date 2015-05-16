package fastflower1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class validatedata
 */
@WebServlet("/validatedata")
public class validatedata extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public validatedata() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			connection con= new connection();
			Statement st=con.getcon().createStatement();
			st.executeUpdate("INSERT INTO password VALUES('"+request.getParameter("mail")+"','"+request.getParameter("password")+"','store')");
			
			Statement st1=con.getcon().createStatement();
		st1.executeUpdate("INSERT INTO store VALUES('"+request.getParameter("mail")+"','"+request.getParameter("sName")+"','"+request.getParameter("aLine1")+"','"+request.getParameter("aLine2")+"',"+request.getParameter("minRank")+",'"+request.getParameter("RadioGroup1")+"',0.0,0.0,'ftvyb',0)");
		st.executeUpdate("INSERT INTO contact VALUES('"+request.getParameter("mail")+"',"+request.getParameter("contact")+")");
		response.sendRedirect("signin/signin.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	//	response.sendRedirect("signin/signin.jsp");
		
	}

}
