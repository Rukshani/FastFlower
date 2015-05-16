package fastflower1;

import fastflower1.Item;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;


@WebServlet("/requesthandle")
public class requesthandle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public requesthandle() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
	       // PrintWriter out = response.getWriter();

	        response.setContentType("text/html;charset=UTF-8");
	        // PrintWriter out = response.getWriter();

	        HttpSession mysession = request.getSession();
	        ArrayList mycart = (ArrayList) mysession.getAttribute("itemlist");
	        
	        int value = (Integer) mysession.getAttribute("total");
	        
	        
	        String c= request.getParameter("addtocart");
	       
	        String chk = request.getParameter("chkout");
	        String logout = request.getParameter("logout");
	        String pressdel = request.getParameter("del");
	        
	        
	        try {			        	
	        	PreparedStatement st=connection.getcon().prepareStatement("select * from product where itemID=?");
				st.setString(1, c);
				ResultSet rss=st.executeQuery();
	        	
				System.out.println(" "+c);
				
				
				while(rss.next()){
					
					if (c!=null) {
			            Item myitem = new Item(rss.getString(1),rss.getString(2),rss.getInt(3));
			            value = value + rss.getInt(3);
			            mycart.add(myitem);
			            mysession.setAttribute("itemlist", mycart);
			            mysession.setAttribute("total", value);
						st.executeUpdate("INSERT INTO cart VALUES("+rss.getString(1)+",'"+rss.getString(2)+"',"+rss.getString(3)+",'bbb')");
						/*if(pressdel!=null){
				        	st.executeUpdate("DELETE FROM cart WHERE number=5");
						}*/
			            response.sendRedirect("customizedproductpage/productpagesession.jsp");
			            
			            
						
			        }
			        					
				}	
				
				
			} catch (Exception ex) {
				System.out.println(ex);
			}
	
	       if (chk != null) {
	            mysession.setAttribute("chk", chk);
	            response.sendRedirect("customizedproductpage/checkout.jsp");

	        } else if (logout != null) {
	            mysession.invalidate();
	            response.sendRedirect("logoutprocess.jsp");
	        } else if (pressdel != null) {

	            Item item_to_Delete = (Item) mycart.get(Integer.parseInt(pressdel));
	            value = value - item_to_Delete.price;
	            mysession.setAttribute("total", value);

	            mycart.remove(Integer.parseInt(pressdel));

	            mysession.setAttribute("tod", pressdel);

	            response.sendRedirect("customizedproductpage/productpagesession.jsp");
	        }
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    private void processRequest(HttpServletRequest request,
				HttpServletResponse response) {
			// TODO Auto-generated method stub
			
		}

		@Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	    
	    @Override
	    public String getServletInfo() {
	        return "Short description";
	    }// </editor-fold>
	

	}
