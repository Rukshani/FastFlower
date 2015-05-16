<%@page import="java.sql.Statement"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String sname=request.getParameter("sName");
String add1=request.getParameter("aLine1");
String add2=request.getParameter("aLine2");
String minRank=request.getParameter("minRank");
String mode=request.getParameter("mode");
String user=session.getAttribute("user").toString();
Statement st=connection.getcon().createStatement();
st.executeUpdate("UPDATE store SET name='"+sname+"' ,addressLine1='"+add1+"' ,addressLine2='"+add2+"', minimumRank="+Integer.parseInt(minRank)+", mode='"+mode+"' WHERE storemail='"+user+"'");
response.sendRedirect("shop.jsp");

%>
</body>
</html>