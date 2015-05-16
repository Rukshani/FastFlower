package fastflower1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/imageview")
public class imageview extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public imageview() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try {
				
			Statement st=connection.getcon().createStatement();
			
			ResultSet rs=st.executeQuery("SELECT * FROM product");
			
			//request.setAttribute("name", "hh");
			//getServletContext().getRequestDispatcher("/productpage/productpage.jsp").forward(request, response);
			
			
			 out.println("<html><body>");
			while(rs.next()){
				out.println("<img src=\""+rs.getString(5)+"\">");	
				//System.out.println("<img src=\""+rs.getString(5)+"\">");
			}
			out.println("</body></html>");
			
			
		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}
