package fastflower1;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addtodbcart")
public class addtodbcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtodbcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ca= request.getParameter("addtocart");
		String de= request.getParameter("del");
        
        
        try {		
			
        	PreparedStatement st=connection.getcon().prepareStatement("select * from product where itemID=?");
			st.setString(1, ca);
			ResultSet rss=st.executeQuery();
        	
			System.out.println(" "+ca);
			
			
			while(rss.next()){
				
				if (ca!=null) {
					
					
					st.executeUpdate("INSERT INTO cart VALUES("+rss.getString(1)+",'"+rss.getString(2)+"',"+rss.getString(3)+",'bbb')");					
		            response.sendRedirect("customizedproductpage/productpagesession.jsp");
		        }/*if(de!=null){
		        	st.executeQuery("DELETE FROM cart WHERE number="+rss.getString(1)+"");
		        	
		        	response.sendRedirect("customizedproductpage/productpagesession.jsp");
		        }*/
				
				
			}	
        } catch (Exception ex) {
			System.out.println(ex);
		}

}

}	
