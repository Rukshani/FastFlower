<%@page import="fastflower1.connection"%>
<%@page import="java.sql.Statement"%>
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
String sname,NIC,designation,URL,mail;
int contact=Integer.parseInt(request.getParameter("contact"));
designation=request.getParameter("designatiion");
URL=request.getParameter("file");
sname=request.getParameter("eName");
NIC=request.getParameter("NIC");
double salary=Double.parseDouble(request.getParameter("salary"));
mail=session.getAttribute("user").toString();
Statement st=connection.getcon().createStatement();
st.executeUpdate("INSERT INTO employee VALUES ('"+mail+"','"+sname+"','"+NIC+"',"+contact+",'"+designation+"',"+salary+",'"+URL+"')");
response.sendRedirect("shop.jsp");
%>
</body>
</html>