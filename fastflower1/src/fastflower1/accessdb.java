package fastflower1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class accessdb
 */
@WebServlet("/accessdb")
public class accessdb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accessdb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try{
			Connection c=connection.getcon();
			Statement st= c.createStatement();
			String user=request.getParameter("user");
			ResultSet rs=st.executeQuery("SELECT * FROM request WHERE storeMail='"+user+"'");
			while(rs.next()){
				String cusMail=rs.getString("customerMail");
				Connection c1=connection.getcon();
				Statement st1= c1.createStatement();
				ResultSet rs1=st1.executeQuery("SELECT fname,mname,lname FROM customer WHERE customerMail='"+cusMail+"'");
				rs1.next();
				int productid=Integer.parseInt(rs.getString("productID"));
				Connection c2=connection.getcon();
				Statement st2= c2.createStatement();
				ResultSet rs2=st2.executeQuery("SELECT description FROM product WHERE itemID="+productid+"");
				rs2.next();
				out.println(
				 "<p><ul><li>Order ID :"+ rs.getString("orderID")+" <ul>"+
				" <li>Customer Mail :"+ rs.getString("customerMail")+" </li>"+
				" <li>Customer Name :"+rs1.getString("fname")+" "+rs1.getString("mname")+" "+rs1.getString("lname")+" </li>"+
				" <li>Product ID :"+ rs.getString("productID")+ "</li>"+
				"<li>Product Description :"+rs2.getString("description")+"</li>"+
				" <li>Delivery Address :"+rs.getString("deliveryAddress")+ "</li>"+
				" <li>Qty :"+ rs.getString("qty")+"</li>"+
				" <li>Due Date :"+ rs.getString("dueDate")+" "+ "Pick Up Time :" +rs.getString("dueTimeShop")+ "</li>"+
				"<li> Customer Delivery Time :"+rs.getString("dueTimeDelivery")+"</li>"+
				" <input name=\"accept\" type=\"button\" value=\"ACCEPT\">"+
				 "  </ul></li>"+
		       " </ul></p> "
						);
				 st1.close();
					 st2.close();
				c1.close();
				c2.close();
				 
			}
			 st.close();
			 c.close();
			//
		}catch(Exception e){
			System.out.print(e);
		}
		finally{
			
		}

		
	}

}
