<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/Pink.jpg">


        <%
        
        //session.setAttribute("usermail", null);
        session.invalidate(); %>

        <h1><font color="000000">You are Sucessfully logged out...</font></h1>

        	<a href="signin/signin.jsp">Sign in</a>

    </body>

</html>
