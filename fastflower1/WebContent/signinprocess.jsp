<%@page import="java.util.ArrayList"%>
<%@page import="fastflower1.connection"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
  try {	
		
		Statement st=connection.getcon().createStatement();
		ResultSet rs=st.executeQuery("SELECT * FROM password");
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		out.println(email);
		out.println(pass);
		
		while(rs.next()){
		 
			 String usermail=rs.getString("usermail");
			 String password=rs.getString("password");
			 String category=rs.getString("category");

			 
			 %>
			 <%
			 if(usermail.equals(email)&&password.equals(pass)){
				 //out.println("Rukssssss"); 
				  
				 
				 if(category.equals("customer")){
					    ArrayList cart=new ArrayList();
			            int totalcost = 0;
			            HttpSession mysession = request.getSession();
			            mysession.setAttribute("user", usermail);
			            mysession.setAttribute("itemlist", cart);
			            mysession.setAttribute("total", totalcost);
			            
				 
				 	response.sendRedirect("customizedproductpage/productpagesession.jsp"); 
				 }
				 if(category.equals("store")){
					
						
						session.setAttribute("user", usermail);
						response.sendRedirect("Shop/shop.jsp");	
				 }
				 if(category.equals("driver")){
					   
					    response.sendRedirect("driverdescription/driverdescription.jsp");
				 }
				 else {
						//getServletContext().getRequestDispatcher("loginerror.html").forward(request, response);
						out.print("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"+
	"<html xmlns=\"http://www.w3.org/1999/xhtml\">"+
	"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>OOpz! Login Error</title><style type=\"text/css\">"+
	"body {	background-image: url(loginecorrect.jpg);background-repeat: no-repeat;}"+
	"#apDiv1 {	position: absolute;	left: 313px;	top: 382px;	width: 247px;	height: 160px;	z-index: 1;}</style></head>"+
	"<body><div id=\"apDiv1\"><a href=\"login/login.html\" class=\"btn btn-primary btn-lg active\" role=\"button\">Click here to go back to login!</a>"+
	"</div></body></html>");
						
						
					}
				 
			 }
			 %>
			 
			 <%
			 session.setAttribute("usermail", email);
			 session.setAttribute("password", pass);
			 %>
			 
			
			 <%
		} 
    } catch (Exception ex) {
        System.out.println(ex);
    } 
%>

<%



%>



</body>
</html>