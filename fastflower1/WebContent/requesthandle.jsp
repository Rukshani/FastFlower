<%@page import="org.apache.tomcat.util.buf.UEncoder"%>
<%@page import="fastflower1.connection"%>
<%@page import="fastflower1.Item"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSetMetaData"%>

<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.annotation.WebServlet"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
			HttpSession mysession=request.getSession();
	        ArrayList mycart = (ArrayList) mysession.getAttribute("itemlist");
	        
	        
	        int value = (Integer) mysession.getAttribute("total");
	        
	        
	        String c= request.getParameter("addtocart");
	        String chk = request.getParameter("chkout");	        
	        String view=request.getParameter("view");
	        String logout = request.getParameter("logout");
	        String pressdel = request.getParameter("del");
	        String username=session.getAttribute("usermail").toString();
	        
	        String quantity=request.getParameter("quantity");
	        
	      //  int qty=Integer.parseInt(quantity);
	        String u=request.getParameter("update");
	        
	        try {			        	
	        	PreparedStatement st=connection.getcon().prepareStatement("select * from product where itemID=?");
				st.setString(1, c);
				ResultSet rss=st.executeQuery();
	        	
				System.out.println(" "+c);
				System.out.println(u+" "+quantity);
			
				while(rss.next()){
					
					if (c!=null) {
			            Item myitem = new Item(rss.getString(1),rss.getString(2),rss.getInt(3));
			            value = value + rss.getInt(3);
			            mycart.add(myitem);
			            mysession.setAttribute("itemlist", mycart);
			            mysession.setAttribute("total", value);
			            st.executeUpdate("INSERT INTO cart VALUES('1',"+rss.getString(1)+","+rss.getString(3)+","+rss.getString(4)+",'"+username+"')");
						//st.executeUpdate("INSERT INTO cart VALUES("+rss.getString(1)+",'"+rss.getString(2)+"',"+rss.getString(3)+",'"+quantity+"','"+username+"')");
						/*if(pressdel!=null){
				        	st.executeUpdate("DELETE FROM cart WHERE number=5");
						}*/
			            response.sendRedirect("customizedproductpage/productpagesession.jsp");
			       						
			        }
			        					
				}	
				
				
			} catch (Exception ex) {
				System.out.println(ex);
			}
	        
	        if(u!=null){
	        	System.out.println(u+" "+quantity);
	        	response.sendRedirect("customizedproductpage/productpagesession.jsp");
	        }
	        else if (chk != null) {
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
	        } else if(view!=null){
	        	
	        	response.sendRedirect("customizedproductpage/mycartview.jsp");
	        	
				
	        }
	 
	    %>
</body>
</html>
