package fastflower1;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderdelivery")
public class orderdelivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public orderdelivery() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(!(request.getParameter("address1")==null)){
		try {
			Statement st= connection.getcon().createStatement();
			st.executeUpdate("INSERT INTO ordereddetails VALUES('"+request.getParameter("address1")+"','"+request.getParameter("address2")+"','"+request.getParameter("note")+"')");	
			
		} catch (SQLException e) {
			response.getWriter().print(e);
		
		}
		}else{
		
			try {	
		 
			int prot=0;
			PreparedStatement st=connection.getcon().prepareStatement("select * from product where itemID=1");
			
			ResultSet rs=st.executeQuery();
			
			
			while(rs.next()){
				prot=Integer.parseInt(rs.getString(5));
				//System.out.println(prot);
				
			}
			    
				int dt=Integer.parseInt(request.getParameter("dt"));
				
				int duetime = 0;
			    PreparedStatement stm=connection.getcon().prepareStatement("select * from cart where orderID=1");
			   
				ResultSet rss=stm.executeQuery();
					
					
					while(rss.next()){
						duetime=dt+prot;	
						
					}
					response.getWriter().println(duetime);
					System.out.println(duetime);
					
				} catch (Exception ex) {
					System.out.println(ex);
					
				}

		}


	}

}
