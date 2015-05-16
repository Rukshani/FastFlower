<!DOCTYPE html>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="fastflower1.requesthandle"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="fastflower1.Item"%>
<%@page import="java.util.ArrayList"%>
<html style="" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Fast Flower Delivery</title>
        <meta name="description" content="fast,flower,delivery">
        <meta name="author" content="Rukshani Somarathna"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="R/bootstrap.css" rel="stylesheet" media="screen">
		<link href="R/bootstrap-responsive.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="R/colorbox.css">
		<link href="R/css.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="R/main.css">
		<link rel="stylesheet" href="R/font-awesome.css">
        <script src="R/modernizr-2.js"></script>
        
        <!-- code for cart buttons -->
			<script type="text/javascript">
				function loadXMLDoc()
				{
				var xmlhttp;
				if (window.XMLHttpRequest)
				  {// code for IE7+, Firefox, Chrome, Opera, Safari
				  xmlhttp=new XMLHttpRequest();
				  }
				else
				  {// code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
				xmlhttp.onreadystatechange=function()
				  {
				  if (xmlhttp.readyState==4 && xmlhttp.status==200)
				    {
				    document.getElementById("cart").innerHTML=xmlhttp.responseText;
				    }
				  }
				
				/* var firstname=document.getElementById("first").value;
				var lastname=document.getElementById("last").value;
				
				xmlhttp.open("GET","../accessdatabase?firstname="+firstname+"&lastname="+lastname,true);
				xmlhttp.send(); */
				}
				</script>
        
    </head>
    <body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					 <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand goTop" href="#">Fast Flower Delivery</a>
					<div class="nav-collapse">
						<ul class="nav">
							<li class="" data-section="1"><a href="#">About Us</a></li>
							<li data-section="2"><a href="#services">Services</a></li>
							<li data-section="3"><a href="#works-bg">Products</a></li>
							<li data-section="4"><a href="#clients">Clients</a></li>
							<li data-section="6"><a href="#price-bg">Price</a></li>
							<li data-section="7"><a href="#contacts">Contact us</a></li>
							<li><a><%=session.getAttribute("usermail") %></a></li>
							<li><a>
								<form method="post" action="../logoutprocess.jsp">
									<input type="submit" value="Logout">
								</form>
								</a>
							</li>
						</ul>
					</div>	
				</div>	
			</div>
		</div>
		<div id="welcome" class="parallax" style="background-image: url(&quot;images/bg1.jpg&quot;); background-position: 50% 0px;">
			<div style="margin-top: 0px; opacity: 1; display: block;" id="logotext" class="text">
				<h1>Fast Flower Delivery</h1>
				<p>The Earth Laughs In Flowers</p>
			</div>
		</div>

		<section id="about" class="text-block" data-section="1">
			<div class="features dark-bg">
				<div class="container">
					<div class="row-fluid">
						<article class="span3">
							<h3 class="color text-center with-border">Weddings</h3>
							<p>Flower arrangements for weddings</p>
						</article>
						<article class="span3">
						<h3 class="color text-center with-border">Flowers and Gifts</h3>
							<p>For anybody who believes in being a grand person</p>
						</article>
						<article class="span3">
							<h3 class="color text-center with-border">Cooperate Events</h3>
							<p>We cater to government functions and provide flowers and decor at the most competitive rates</p>
						</article>
						<article class="span3">
							<h3 class="color text-center with-border">Wholesale and Retail</h3>
							<p>Island wide delivery can be arranged for wholesale orders</p>
						</article>
					</div>
				</div>	
			</div>	
			<div class="light-bg">
			  <div class="container">
					<h2>About us</h2>
					<div class="section clearfix">
						<p>Fast Flower Delivery is Sri Lanka's largest e-commerce organization. With over 10000 products and over 30 types of distinct services Fast Flower Delivery has set the bar for e-commerce footprint of Sri Lanka. Fast Flower Delivery primary goal to provide a world class service to Sri Lankan's who shop online. Inspired by the truly Sri Lankan tradition Fast Flower Delivery welcomes you for the experience of professional gift delivery service in the international standards.</p>
					</div>
					<div class="row-fluid section">
						<div class="span6">
							<h3 class="with-border">Our Skills</h3>
							<div class="progress-block">
								<div class="progress">
								  <div class="bar" style="width: 100%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Delivery</a>
									<span class="value">100%</span>
								</div>
								<div class="progress">
									<div class="bar " style="width: 85%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Development</a>
									<span class="value">85%</span>
								</div>
								<div class="progress">
									<div class="bar" style="width: 75%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Branding</a>
									<span class="value">75%</span>
								</div>	
								<div class="progress">
									<div class="bar" style="width: 60%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Usability</a>
									<span class="value">60%</span>
								</div>	
								<div class="progress">
									<div class="bar" style="width: 100%;"></div>
									<a data-section="3" class="progress-name toSection" href="#">Reliability</a>
									<span class="value">100%</span>
								</div>	
							</div>
						</div>
					<!-- 	<div class="span6">
							<h3 class="with-border">Watch who we are</h3>
							<div class="videoWrapper">
								<iframe src="R/20596477.htm" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" frameborder="0"></iframe>
							</div>						</div>  -->
					</div>
					
				
				</div>	
			</div>	
		</section>	
		
		<div id="services-bg" class="parallax" style="background-image: url(images/bg4.jpg);">
			<div class="black-bg">
				<div class="text">
					<blockquote>
					  <h2>the earth laughs in flowers</h2>
						Faster Delivery</blockquote>
				</div>
			</div>	
		</div>
		
		<section id="services" class="text-block" data-section="2">
			<div class="light-bg">
				<div class="container">
					<h2>Our services</h2>
					<p>We cater to government functions and provide flowers and decor at the   most competitive rates. We also specialize in providing flowers and   related services to the rapidly expanding corporate sector in Sri Lanka.   Our service is professional and personalized, and we aim to provide   utmost customer satisfaction with your individual needs in mind. We are   able to provide a variety of floral solutions to multinational   conglomerates, hospitality trade organizations, and locally owned   business undertakings with daily needs of floral decor and specified   objectives. Count on us as many do for excellent service, in order to   create a unique and lasting impression.</p>
					<div class="row-fluid second-service">
						<article class="span4">
							<div class="block-icon"></div>
							<h3 class="with-border">Fast delivery</h3>
						</article>
						<article class="span4">
							<div class="block-icon"></div>
							<h3 class="with-border">Reliable</h3>
						</article>
						<article class="span4">
							<div class="block-icon"></div>
							<h3 class="with-border"> Hospitality </h3>
      					</article>
					</div>
				</div>	
			</div>	
			<div class="dark-bg"></div>
		</section>
		
		<div id="works-bg" class="parallax" style="background-image: url(images/image_1.jpg);">
			<div class="black-bg">
				<div class="text">
					<h2>We Care Always</h2>
				</div>	
			<a href="#" data-section="3" class="toSection"></a></div>	
		</div>
		
		
		<section id="works" class="text-block" data-section="3">
			<div class="light-bg">
				<div class="container">
					<h2>Products</h2>
                    
        <div class="container">
            <form method="post" action="../requesthandle.jsp">
                <div class="headbanner">
                    <h3 style="display:inline">
                       Shopping Cart 
                    </h3>
                </div>
                <div class="mycontent" id="cart">
                    <div class="cartof">
                        <a style="color: #CC3300;"></a>
                    </div>
                    <div class="cartcontent" id="cartdiv">
                        <div class="myitems">
                            <table width="600px">
                            
                            <!-- shopping cart table -->
                                <tr>
                                    <th>Product ID</th> 
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Action</th>
                                </tr>
                                <%if (session.getAttribute("itemlist") != null) {
                                        ArrayList mycart = (ArrayList) session.getAttribute("itemlist");
                                        for (int i =0; i < mycart.size(); i++) {
                                        	Item it=(Item)mycart.get(i);
                                %>
                                <tr>
                                    <td align="center"><% out.print(it.id);%></td>
                                    <td align="center"><% out.print(it.name);%></td> 
                                    <td align="center"><% out.print(it.price);%></td>
                                    <td align="center"><input type="number" name="quantity" id="quantity"/></td>
                                    <td align="center"><input name="del" type="submit" value="Delete" onclick="this.value=<%out.print(i);%>"/></td>
                                </tr>
                                <%}
                                    }
                                %>    
                            </table>
                        </div>
                        <div class="total">
                            <a>My Total : Rs[<% out.print(session.getAttribute("total"));%>]</a><br />
                            <a style="font-size:14px">
                            		Total Qty: [<% ArrayList il = (ArrayList) session.getAttribute("itemlist");
                       				out.print(il.size());%>]
                       		</a><br/>
                            <input name="chkout" type="submit" value="Checkout"/>
                            <input name="update" type="submit" id="update" value="Update">
                            <input name="view" type="submit" value="View Cart"/>
                        </div>
                    </div>
                   
					<%
					try {		
								
						Statement stmt=connection.getcon().createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM product");
						ResultSetMetaData rsmd=rs.getMetaData();
						int numberOfColumns = rsmd.getColumnCount();
						
						out.print("<table border=\"1\" width=\"100%\">");
						out.print("<tr width=\"100%\"><th width=\"10%\">ID</th><th width=\"20%\">Name</th><th width=\"10%\">Price</th><th width=\"10%\">Availability</th><th width=\"30%\">Image</th><th width=\"20%\">Option</th></tr>");
						
						while(rs.next()){
							out.print("<tr>");
							
							for(int i=1;i<=numberOfColumns;i++){
								
								if(i==5){
									out.println("<td><center><img src=\"../"+rs.getString(6)+"\" width=\"150\" height=\"100\"></center></td>");
									continue;
								}
							 
								if(i==6){
									out.println("<td><Button name=\"addtocart\" type=\"submit\" value=\""+rs.getString(1)+"\" onclick=\"loadXMLDoc()\">Add to Cart</Button></td>");
									
									continue;
									/* <form method=\"post\" action=\"../addtodbcart\"> */
								}
								if(i==7){
									continue;
								}
								 out.print("<td>"+rs.getString(i)+"</td>");
								 
						}
						out.print("</tr>");
						
						}
						out.print("</table>");
						
					} catch (Exception ex) {
						System.out.println(ex);
						System.err.println(ex);
					}
			
					%>
			                    
                    	<!-- First name:<br>
						<input id="first" type="text" name="firstname">
						<br>
						Last name:<br>
						<input id="last" type="text" name="lastname">
						<br>
						<button type="button" onclick="loadXMLDoc()">Change Content</button>
						<div id="myDiv"><h2>Let AJAX change this text</h2></div>
                     -->
                    
                    
                 
                </div>
               
            </form>
 		</div>		 
        </div>
        </div>
        </section>
		
		
		<section id="clients" class="text-block" data-section="4">
			<div class="light-bg">
				<div class="container">
				  <h2>&nbsp;</h2>
					<div class="testimonials-block section">
					  <div class="row-fluid"></div>	
					</div>
					<div class="section">
						<h3 class="with-border">Some of our Suppliers</h3>
						<div class="clients-block">
							<div class="row-fluid">
								<article class="span2">
									<img src="images/client-1.png" alt="pro flowers">
								</article>
								<article class="span2">
									<img src="images/client-2.png" alt="">
								</article>
								<article class="span2">
									<img src="images/client-3.png" alt="">
								</article>
								<article class="span2">
									<img src="images/client-4.png" alt="">
								</article>
								<article class="span2">
									<img src="images/client-5.png" alt="">
								</article>
								<article class="span2">
									<img src="images/client-6.png" alt="">
								</article>
							</div>	
						</div>
					</div>	
				</div>	
			</div>	
		</section>
		
				
	
		
	<section id="contacts" class="text-block" data-section="7">
			<div class="dark-bg">
				<div class="container">
					<h2>Keep in touch</h2>
					<div class="row-fluid section">
						<div class="span8">
							<h3 class="with-border">Questions???</h3>
							<form class="form clearfix" action="">
								<input class="span12" placeholder="Name" name="name" type="text">
								<input class="span12" placeholder="Email" name="email" type="email">
								<input class="span12" placeholder="Subject" name="subject" type="text">
								<textarea class="span12" placeholder="Message" name="message" rows="6"></textarea>
								<button class="btn btn-large pull-right" type="submit">Submit</button>
							</form>
						</div>
						<div class="span4">
							<h3 class="with-border">Our information</h3>
							<div class="info-block">
								<article class="clearfix">
									<address>
										Katubedda,<br>
										Moratuwa	
									</address>
								</article>
								<article class="clearfix">
									
									<p>0712223334</p>
								</article>
								<article class="clearfix">	
									
									<p><a href="#">fastflower@gmail.com</a></p>
								</article>	
							</div>	
						</div>
					</div>
				</div>	
			</div>	
		</section>
		<footer>
			<div class="light-bg">
				<div class="container">
					<div class="row-fluid">
						<div class="span3">
							<h4>Keep in touch</h4>
							<div class="info-block">
								<article class="clearfix">
									<address>
										Katubedda,<br>
										Moratuwa	
									</address>
								</article>
								<article class="clearfix">
									<p>0712223334</p>
								</article>
								<article class="clearfix">
									<p><a href="#">fastflower@gmail.com</a></p>
								</article>	
							</div>	
						</div>
						<div class="span3">
							<h4>Follow us</h4>
							<div class="social">
								<ul class="unstyled clearfix">
									<li>
										<a target="_blank" title="Facebook" href="http://facebook.com"></a>
									</li>
									<li>
										<a target="_blank" title="Twitter" href="http://twitter.com"></a>
									</li>
									<li>
										<a target="_blank" title="Instagram" href="http://instagram.com"></a>
									</li>
									<li>
										<a target="_blank" title="Gmail" href="http://gmail.com"></a>
									</li>
								</ul>
							</div>	
						</div>
						<div class="span3">
							<h4>Recent posts</h4>
							<ul>
								<li><a href="#">A</a></li>
								<li><a href="#">B</a></li>
								<li><a href="#">C</a></li>
								<li><a href="#">D</a></li>
								<li><a href="#">E</a></li>
								<li><a href="#">F</a></li>
							</ul>
						</div>
					</div>
				</div>	
		  </div>		
	</footer>
		
		<a style="display: none;" class="goTop goTop-link"></a>
		
        <script src="R/jquery_002.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
		<script src="R/bootstrap.js"></script>
		<script src="R/waypoints.js"></script>
        <script src="R/plugins.js"></script>
		<script src="R/jquery.js"></script>
        <script src="R/main.js"></script>
        
        
			    

<div style="display: none;" id="cboxOverlay"></div><div style="display: none;" tabindex="-1" role="dialog" class="" id="colorbox"><div id="cboxWrapper"><div><div style="float: left;" id="cboxTopLeft"></div><div style="float: left;" id="cboxTopCenter"></div><div style="float: left;" id="cboxTopRight"></div></div><div style="clear: left;"><div style="float: left;" id="cboxMiddleLeft"></div><div style="float: left;" id="cboxContent"><div style="float: left;" id="cboxTitle"></div><div style="float: left;" id="cboxCurrent"></div><button id="cboxPrevious" type="button"></button><button id="cboxNext" type="button"></button><button id="cboxSlideshow"></button><div style="float: left;" id="cboxLoadingOverlay"></div><div style="float: left;" id="cboxLoadingGraphic"></div></div><div style="float: left;" id="cboxMiddleRight"></div></div><div style="clear: left;"><div style="float: left;" id="cboxBottomLeft"></div><div style="float: left;" id="cboxBottomCenter"></div><div style="float: left;" id="cboxBottomRight"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div></div>

</body></html>