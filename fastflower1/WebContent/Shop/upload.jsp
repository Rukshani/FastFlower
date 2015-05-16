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
int i=0;
Statement st=connection.getcon().createStatement();
String user=session.getAttribute("user").toString();

st.executeUpdate("INSERT INTO product VALUES("+i+",'"+request.getParameter("name")+"',"+request.getParameter("price")+","+request.getParameter("qty")+","+request.getParameter("process")+",'"+request.getParameter("file")+"','"+user+"')");
st.close();
response.sendRedirect("shop.jsp");
%>
</body>
</html>