<%@page import="fastflower1.Item"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="fastflower1.connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product</title>
</head>
<body>


<%
String del= request.getParameter("delete");
String username=session.getAttribute("usermail").toString();

try {			        	
	PreparedStatement st=connection.getcon().prepareStatement("select * from cart where orderID=?");
	st.setString(1, del);
	ResultSet rss=st.executeQuery();	
				
	while(rss.next()){		
		if (del!=null) {
			System.out.println("orderID: "+rss.getString(1));
			st.executeUpdate("delete from cart where orderID="+rss.getString(1)+"");
			response.sendRedirect("customizedproductpage/mycartview.jsp");			          
        }        					
	}	
	
	
} catch (Exception ex) {
	System.out.println(ex);
}

%>

</body>
</html>