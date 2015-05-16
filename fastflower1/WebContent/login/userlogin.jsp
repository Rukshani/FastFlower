<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="fastflower1.connection"%>

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
	String user=request.getParameter("email");
	String password=request.getParameter("password");
	
	session.setAttribute("user", user);
	response.getWriter().print(session.getAttribute("user"));
try{

Statement st=connection.getcon().createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM password");
while(rs.next()){
	String pass=rs.getString("password");
	String name=rs.getString("usermail");
	String category=rs.getString("category");
	if (pass.equals(password)&& name.equals(user)) {
		if(category.equals("store")){
			System.out.print("okkkkk");
			//session.setAttribute("username", user);
			//request.setAttribute("username", user);
			response.sendRedirect("../Shop/shop.jsp");}
	}
			
		
		

}}
catch(Exception e){
	System.out.print(e);
}
%>
</body>
</html>