package fastflower1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class validatelogin
 */
@WebServlet("/validatelogin")
public class validatelogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validatelogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   //response.sendRedirect("Shop/shop.html");
		//connection con= new connection();
		try {
			Statement st= connection.getcon().createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM password");
			String password=request.getParameter("password");
			String pass="mama",category=null,user=null;
			String userentered=request.getParameter("email");
			
		
			while (rs.next()) {
				
				category=rs.getString("category");
				pass=rs.getString("password");
				user=rs.getString("usermail");
				
				if (pass.equals(password)&& user.equals(userentered)) {
					if(category.equals("store")){
						
						request.setAttribute("username", user);
						response.sendRedirect("Shop/shop.jsp");
						
					
					}
					if(category.equals("customer")){
				
						response.sendRedirect("productpage/productpagesession.jsp");
					}
				} else {
					PrintWriter out=response.getWriter();
					//getServletContext().getRequestDispatcher("loginerror.html").forward(request, response);
					out.print("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"+
"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>OOpz! Login Error</title><style type=\"text/css\">"+
"body {	background-image: url(loginecorrect.jpg);background-repeat: no-repeat;}"+
"#apDiv1 {	position: absolute;	left: 313px;	top: 382px;	width: 247px;	height: 160px;	z-index: 1;}</style></head>"+
"<body><div id=\"apDiv1\"><a href=\"login/login.html\" class=\"btn btn-primary btn-lg active\" role=\"button\">Click here to go back to login!</a>"+
"</div></body></html>");
					
					
				}
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}
