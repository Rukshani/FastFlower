<%@page import="javax.imageio.stream.FileImageOutputStream"%>
<%@page import="javax.imageio.stream.ImageOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.stream.FileImageInputStream"%>
<%@page import="javax.imageio.stream.ImageInputStream"%>
<%@page import="java.awt.image.BufferedImage"%>
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
try{
	
	String name=request.getParameter("name");
	String path="C:/Users/Dilshani Rangana/Desktop/image/"+name;
	//Statement st=connection.getcon().createStatement();
	//st.executeUpdate("INSERT INTO fastflower.check VALUES('"+path+"')");
	String name1="C:/Users/Dilshani Rangana/Desktop/kuweni/"+name;
	//upload to a folder
	File f=new File(name1);
	File f1=new File(path);
	ImageInputStream in= new FileImageInputStream(f);
	ImageOutputStream out1=new FileImageOutputStream(f1);
	
	byte[] buf =new byte[1024];
	int length;
	while((length=in.read(buf))>0){
		
		out1.write(buf,0,length);
	}
	in.close();out1.close();
	
	
}
catch(Exception e){
	System.out.print(e);
}
%>
</body>
</html>