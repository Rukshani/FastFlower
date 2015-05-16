<%@page import="java.io.PrintWriter"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.ResultSet"%>
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
 Statement st=connection.getcon().createStatement();
 ResultSet rs=st.executeQuery("SELECT * FROM store");

double lat=Double.parseDouble(rs.getString("latitude"));
double lang=Double.parseDouble(rs.getString("longitutde"));
String name=rs.getString("storemail");

request.setAttribute("lat", lat);
request.setAttribute("lang", lang);
request.setAttribute("store", name);

//response.sendRedirect("supun.html");

PrintWriter out1=response.getWriter();
out.print(request.getAttribute(name));

%>
</body>
</html>