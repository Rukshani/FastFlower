<!DOCTYPE HTML>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
	<head>
		<title>Cart</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
        <meta name="author" content="Rukshani"/>
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
			<link rel="stylesheet" href="css/style-noscript.css" />
		</noscript>
	</head>
	<body>
			<div id="wrapper">
					<nav id="nav">
						<a href="#me"><img src="imagesdemo/cart2.png" height="100" width="100"><span>Cart</span></a>
						<a href="#work"><img src="imagesdemo/wishlist1.png" height="100" width="100"><span>Wish List</span></a>	
					</nav>
					<div id="main">
					  <article class="panel" id="me" name="me">
					  	
                       	
                       	<form method="post" action="../deleteproduct.jsp">
                       	<p>
                        <%        
                        String username=session.getAttribute("usermail").toString();
                        PreparedStatement stv=connection.getcon().prepareStatement("select * from cart where customermail=?");
        				stv.setString(1,username);
        				ResultSet rsv=stv.executeQuery();
        				
        				ResultSetMetaData rsmd=rsv.getMetaData();
        				int numberOfColumns = rsmd.getColumnCount();
        				
        				
        				out.print("<table border=\"1\" width=\"100%\">");
        				out.print("<tr width=\"100%\"><th width=\"10%\">Order ID</th><th width=\"20%\">Product ID</th><th width=\"10%\">Price</th><th width=\"10%\">Quantity</th><th width=\"10%\">Action</th></tr>");
        				
        				while(rsv.next()){
        					out.print("<tr>");
        					
        					for(int i=1;i<=numberOfColumns;i++){
        						if(i==5){
        							out.println("<td align=\"center\"><Button name=\"delete\" type=\"submit\" value=\""+rsv.getString(1)+"\" onclick=\"loadXMLDoc()\">Delete</Button></td>");
        							//System.out.println("orderid: "+rsv.getString(1));
        							continue;
        						}
        						out.print("<td align=\"center\"><font color=\"0000ff\">"+rsv.getString(i)+"</font></td>");
        					}
        				out.print("</tr>");        				
        				}
        				out.print("</table>");
						%>		
						</p>					
					</form>
					
					
					
                         
					  </article>
							<article id="work" class="panel">
								<header>
									<h2>Wishlist</h2>
							  	</header>
								
								<section>
									<div class="row">
										<div class="4u">
											<a href="#" class="image fit"><img src="images/pic01.jpg" alt=""></a>
										</div>
										<div class="4u">
											<a href="#" class="image fit"><img src="images/pic02.jpg" alt=""></a>
										</div>
										<div class="4u">
											<a href="#" class="image fit"><img src="images/pic03.jpg" alt=""></a>
										</div>
									</div>
								</section>
					  </article>

			  </div>
					<div id="footer">
						<ul class="copyright">
							<li>&copy; Fast Flower Delivery System</li>
						</ul>
					</div>
			</div>
	</body>
</html>