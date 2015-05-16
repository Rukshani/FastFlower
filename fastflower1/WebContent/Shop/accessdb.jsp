<%@page import="java.sql.ResultSet"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
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
try{
	Statement st=connection.getcon().createStatement();
	ResultSet rs=st.executeQuery("SELECT * FROM transaction WHERE storemail='"+session.getAttribute("user")+"'");
	while(rs.next()){%>
		 <p><ul><li>Order ID : <%=rs.getString("orderID") %><ul>
		 <li>Customer Name : <%=rs.getString("customerName") %></li>
		 <li>Product ID : <%=rs.getString("productID") %></li>
		 <li>Delivery Address : <%=rs.getString("deliveryAddress") %></li>
		 <li>Qty : <%=rs.getString("qty") %></li>
		 <li>Due Date : <%=rs.getString("dueDate") %> Due Time : <%=rs.getString("dueTime") %></li>
		  <input name="accept" type="button" value="ACCEPT">
		   </ul></li>
        </ul>    
 				   	               
              </p>
		 
		 
	<%}
}catch(Exception e){
	System.out.print(e);
}

%>

</body>
</html>