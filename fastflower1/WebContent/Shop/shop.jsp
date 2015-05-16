<!DOCTYPE HTML>
<!--
	Prologue by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="fastflower1.connection"%>
<%@page import="java.sql.Connection"%>

<html>
	<head>
		<title>Fast Flower Order Processing.</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.scrolly.min.js"></script>
		<script src="js/jquery.scrollzer.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
<!----------------------------------------------------------------->        
      <!--link href="css/tabcontent.css" rel="stylesheet" type="text/css" /-->
	  <script src="js/tabcontent.js" type="text/javascript"></script>
	  <script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>  
      
      <style>   
         			
ul.tabs1 li
{
display: inline;
margin: 0;
margin-right:3px;
}

ul.tabs1
{
    padding: 7px 0;
    font-size: 0;
    margin:0;
    list-style-type: none;
    text-align: left;
}

        
ul.tabs1 li a
{
	
	
		font-family: 'Source Sans Pro', sans-serif;
		font-size: 19pt;
		font-weight: 300;
		line-height: 1.75em;
		color: #888;
    
    position: relative;
    padding: 7px 16px;
    border: 1px solid #CCC;
    border-bottom-color:#B7B7B7;
    
    border-radius: 3px 3px 0 0;
    outline:none;
}
       
ul.tabs1 li a:visited
{
    color: #000;
}
        
ul.tabs1 li a:hover
{
    border: 1px solid #B7B7B7;
    background:black;
}
        
ul.tabs1 li.selected a, ul.tabs1 li.selected a:hover
{
    position: relative;
    top: 0px;
    font-weight:bold;
    background-color:rgba(51,0,0,.5);
    border: 1px solid #B7B7B7;
    border-bottom-color: #f6369a;
}
        
        
ul.tabs1 li.selected a:hover
{
    text-decoration: none;
	background-color:rgba(0,51,51,1);
}

div.tabcontents1
{
    border: 1px solid #B7B7B7; padding: 30px;   
    border-radius: 0 3px 3px 3px;
}

ul.li[tabindex="0"] a{
  background-color:blue;
}
</style>  
                
<!--------------------------------------------------------------------->        
		<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
	<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
           
		</noscript>
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
        
        <!-- New code -->
       
		<noscript>
		
		</noscript>
		<%
		String user=session.getAttribute("user").toString();
		try{
		Statement st=connection.getcon().createStatement();
		ResultSet rs=st.executeQuery("SELECT * FROM store WHERE storemail='"+user+"'");
		while(rs.next()){
		String mail=rs.getString("storemail");
		String name,add1,add2,min,mrank;
		//if(user.equals(mail)){
		name=rs.getString("name");
		add1=rs.getString("addressLine1");
		add2=rs.getString("addressLine2");
		min=rs.getString("minimumRank");
		mrank=rs.getString("rank");
		session.setAttribute("name", name);
		session.setAttribute("add1", add1);
		session.setAttribute("add2",add2 );
		session.setAttribute("min",min );
		session.setAttribute("mrank",mrank );
		
		
		
		}
		//}
		}
		catch(Exception e)
		{System.out.print(e);}
		
		 %>
		
	</head>
	<body>

		<!-- Header -->
			<div id="header" class="skel-layers-fixed">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/Flower_logo.jpg" alt="Logo" width="69" height="61" /></span>
						  <h1 id="title"><%=session.getAttribute("name") %></h1>
							<p>Fast Flower Delivery System.</p>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<!--
							
								Prologue's nav expects links in one of two formats:
								
								1. Hash link (scrolls to a different section within the page)
								
								   <li><a href="#foobar" id="foobar-link" class="icon fa-whatever-icon-you-want skel-layers-ignoreHref"><span class="label">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld" id="foobar-link" class="icon fa-whatever-icon-you-want"><span class="label">Foobar</span></a></li>
							
							-->
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">Notifications</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">Products</span></a></li>
								<li><a href="#Upload" id="Upload-link" class="skel-layers-ignoreHref"><span class="icon fa-pencil">Upload Products</span></a></li>
                                <li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">Profile</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">Contacts</span></a></li>
                                <li><a href="../signin/signin.jsp" id="Signout-link" class="skel-layers-ignoreHref"><span class="icon fa-arrow-circle-left">Sign Out</span></a></li>
							</ul>
						</nav>
						
				</div>
				
				<div class="bottom">

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="https://www.twitter.com/" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="https://www.facebook.com/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="https://www.gmail.com/" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
				
				</div>
			
			</div>

		<!-- Main -->
			<div id="main">

				<!-- Notification -->
					<section id="top" class="one dark cover">
						<div class="container">

							<header>
								<h2 class="alt"> <strong>Welcome to <br/>Fast Flower Delivery Service.</strong> 
								</h2>
  </header>
								 <div style="width: 950px; margin: 0 auto; padding: 50px 0 40px;">
        <ul class="tabs" data-persist="true">
            <li><a href="#view6">New Orders</a></li>
            <li><a href="#view7">Due Orders</a></li>
           
        </ul>
        <div class="tabcontents1">
            <div id="view6">
            
         
                
              <p><ul><li>Order ID : 00856<ul>
        <li>Customer Name :Mr. Sandith Gunarathna</li>
        <li>Product ID :48516</li>
        <li>Delivery Address :222, yongammulla, yakkala</li>
        <li>Qty :4</li>
        <li>Due Date :23/11/14 Due Time :5.30pm</li>
        <input action="" name="accept" type="button" value="ACCEPT">
        </ul></li>
        </ul>    
 				   	               
              </p> 
             
            </div>
          
       
            
          <div id="view7">
                

                <p><ul><li>Order ID : 00520<ul>
        <li>Customer Name :Miss. Hansani Kanchana</li>
        <li>Product ID :45623</li>
        <li>Delivery Address :89,kirulapana,colombo 5</li>
        <li>Qty :1</li>
        <li>Due Date :10/11/14 Due Time :9.30am</li>
        <li>Driver Name :Chanuka Wijekoon</li>
         <input name="accept" type="button" value="Processed">
        </ul></li>
        </ul>    
 				   	               
              </p>  
              <p><ul><li>Order ID : 00642<ul>
        <li>Customer Name :Mr. Puff Ranger</li>
        <li>Product ID :5861</li>
        <li>Delivery Address :56,hansagiri rd,yakkala</li>
        <li>Qty :4</li>
        <li>Due Date :10/11/14 Due Time 11.30am</li>
        <li>Driver Name :Harsha Priyadarshana</li>
         <input name="accept" type="button" value="Processed">
        </ul></li>
        </ul>    
 				   	               
              </p> 
             
            
                
            </div>
            
            </div>
         
							<footer></footer>

						</div></div>
					</section>
					
				<!-- Products -->
					<section id="portfolio" class="two">
						<div class="container">
					
							<header>
								<h2>Our Products</h2>
							</header>
						
							<div class="row">
								<div class="4u">
									<article class="item">
										<a href="#" class="image fit"><img src="images/products/1.jpg" alt="" /></a>
										<header>
											<h3>Daisy Love</h3>
                                            <h5>Available Qty :</h5>
                                            <h5>Price :</h5>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/products/2.jpg" alt="" /></a>
										<header>
											<h3>Orchid Beauty</h3>
                                            <h5>Available Qty :</h5>
                                            <h5>Price :</h5>
										</header>
									</article>
								</div>
								<div class="4u">
									<article class="item">
										<a href="#" class="image fit"><img src="images/products/3.jpg" alt="" /></a>
										<header>
											<h3>Elegant Lily</h3>
                                            <h5>Available Qty :</h5>
                                            <h5>Price :</h5>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/products/4.jpg" alt="" /></a>
										<header>
											<h3>Flowery Moment</h3>
                                            <h5>Available Qty :</h5>
                                            <h5>Price :</h5>
										</header>
									</article>
								</div>
								<div class="4u">
									<article class="item">
										<a href="#" class="image fit"><img src="images/products/5.jpg" alt="" /></a>
										<header>
											<h3>vivid beauty</h3>
                                            <h5>Available Qty :</h5>
                                            <h5>Price :</h5>
										</header>
									</article>
									<article class="item">
										<a href="#" class="image fit"><img src="images/products/6.jpg" alt="" /></a>
										<header>
											<h3>Rose Romance</h3>
                                            <h5>Available Qty :</h5>
                                            <h5>Price :</h5>
										</header>
									</article>
								</div>
							</div>

						</div>
					</section>

				<!-- Upload Products -->
					<section id="Upload" class="three">
						<div class="container">
                        <header>
                        <h2>Upload products</h2>
                        </header>
                        
                         <h3> Insert a new Product</h3>
            			<form action="upload.jsp" method="post" >
                        <p>
                		<label for="name">Product Name *</label>
               			<input id="name" type="text" name="name" value="" />
               		    </p>
                
                		<p>
                		<label for="price">Price</label>
                		<input id="price" type="text" name="price" value="" />
                		</p>
                		
                		<p>
                		<label for="price">Required Process Time</label>
                		<input id="process" type="text" name="process" value="" />
                		</p>
                        
                        <p>
                		<label for="qty">Quantity</label>
                		<input id="qty" type="text" name="qty" value="" />
                		</p>
                        
                        <p>
                        <label for="file">Image</label>
                		<input type="file" name="file" />                        
                		<input type="submit" value="upload" />
            			</form>         
                        </p>
                        </div>
					</section>
                    
                    
                    
                    
							<!--profile -->
                            
                            
                            <!--start ofnew code -->
                         <!--div id="wrapper"-->
								    
<!-----------------------------------------------------------------------------------------------------------------------> 
<style>   
         			
ul.tabs li
{
display: inline;
margin: 0;
margin-right:3px;
}

ul.tabs
{
    padding: 7px 0;
    font-size: 0;
    margin:0;
    list-style-type: none;
    text-align: left; /*set to left, center, or right to align the tabs as desired*/
	
}

        
ul.tabs li a
{
	
	
		font-family: 'Source Sans Pro', sans-serif;
		font-size: 19pt;
		font-weight: 300;
		line-height: 1.75em;
		color: #888;
    
    position: relative;
    padding: 7px 16px;
    border: 1px solid #CCC;
    border-bottom-color:#B7B7B7;
    
    border-radius: 3px 3px 0 0;
    outline:none;
}
       
ul.tabs li a:visited
{
    color: #000;
}
        
ul.tabs li a:hover
{
    border: 1px solid #B7B7B7;
    background:#F0F0F0;
}
        
ul.tabs li.selected a, ul.tabs li.selected a:hover
{
    position: relative;
    top: 0px;
    font-weight:bold;
    background: white;
    border: 1px solid #B7B7B7;
    border-bottom-color: white;
}
        
        
ul.tabs li.selected a:hover
{
    text-decoration: none;
}

div.tabcontents
{
    border: 1px solid #B7B7B7; padding: 30px;   
    border-radius: 0 3px 3px 3px;
}
</style>


						<section id="about" class="four">
						<div class="container">

							<header>
								<h2>Profile</h2>
							</header>
                             </div>
                           
                           <div style="width: 950px; margin: 0 auto; padding: 50px 0 40px;">
        <ul class="tabs" data-persist="true">
            <li><a href="#view1">View Profile</a></li>
            <li><a href="#view2">Edit Profile</a></li>
            <li><a href="#view3">Employees</a></li>
            <li><a href="#view4">Add Employees</a></li>
            <li><a href="#view5">View Reports</a></li>
        </ul>
        <div class="tabcontents">
            <div id="view1">
                

                <p>Shop name    : <%=session.getAttribute("name") %><br/>
                   
				   Shop Address	: <%=session.getAttribute("add1") %>  <%=session.getAttribute("add2") %><br/>    
                   Minimum Rank : <%=session.getAttribute("min") %>    <br/>
                   Your Rank    : <%=session.getAttribute("mrank") %>    <br/>
                   Contact No   : <% Statement st=connection.getcon().createStatement();
                   String mail=session.getAttribute("user").toString();
                   ResultSet rs=st.executeQuery("SELECT * FROM contact WHERE usermail='"+mail+"'");
                   while(rs.next()){
                   String contact=rs.getString("contactNo");
                  %>
                     <%=contact %>  <br/><%} %>
                     
 				   	               
              </p>   
                
            </div>
            
            
            
            <div id="view2"><form action="savedetails.jsp" method="post">
              <p><span id="sprytextfield1">
                  <label for="sName">Shop Name :</label>
                  <input type="text" name="sName" id="sName">
          <span class="textfieldRequiredMsg">required!</span></span></p>
            <p>  <span id="sprytextfield2">
              <label for="aLine1">Address Line 2:</label>
              <input type="text" name="aLine1" id="aLine1">
              <span class="textfieldRequiredMsg">required!</span></span></p> 
              
              <p>  <span id="sprytextfield3">
              <label for="aLine2">Address Line 1:</label>
              <input type="text" name="aLine2" id="aLine2">
              <span class="textfieldRequiredMsg">required!</span></span></p>   
              
              
              <p>  <span id="sprytextfield3">
              <label for="minRank">Minimum Rank:</label>
              <input type="text" name="minRank" id="minRank">
              <span class="textfieldRequiredMsg">required.</span></span></p>
              
              <p>  <span id="sprytextfield4">
              <label for="mode">Mode:</label>
              <input type="text" name="mode" id="mode">
              <span class="textfieldRequiredMsg">required.</span></span></p>   
              
               <p>
                        <label for="file">Image</label>
                		<input type="file" name="file" />                        
                		<input type="submit" value="upload" />
            			</form>         
                        </p>
              </div>
            
            
            
            
            <div id="view3">
                
                <ul>
                    <li>Number of registered employees : 10</li>
                    <li>Shop Owner :Mr. Supun Priyadarshana.</li>
                    <li><ul><li>Contact No :0713414766</li></ul></li>
                    <li>Shop Manager :Miss. Dilshani Kumarapeli.</li>
                    <li><ul><li>Contact No :0715929748</li></ul></li>
                    <li>Order Processing Coordinator : Mr.Janitha Chanuka.</li>
                    <li><ul><li>Contact No :0715426789</li></ul></li>
                   <li>Delivery Process Coordinator : Miss. Rukshani Nilakshika.</li>
                   <li><ul><li>Contact No :0718492156</li></ul></li>
                        
                </ul>
            </div>
            
            <div id="view4">
                
                <form  action="saveemployee.jsp">
              <p><span id="sprytextfield1">
                  <label for="sName">Employee Name :</label>
                  <input type="text" name="eName" >
          <span class="textfieldRequiredMsg">required!</span></span></p>
            <p>  <span id="sprytextfield2">
              <label for="aLine1">Nic No :</label>
              <input type="text" name="NIC" >
              <span class="textfieldRequiredMsg">required!</span></span></p> 
              
              <p>  <span id="sprytextfield3">
              <label for="aLine2">Contact No:</label>
              <input type="text" name="contact" >
              <span class="textfieldRequiredMsg">required!</span></span></p>
              
              
              <p>  <span id="sprytextfield3">
              <label for="minRank">Designation:</label>
              <input type="text" name="designation">
              <span class="textfieldRequiredMsg">required.</span></span></p>
              
              <p>  <span id="sprytextfield4">
              <label for="mode">Salary :</label>
              <input type="text" name="salary">
              <span class="textfieldRequiredMsg">required.</span></span></p>   
              
               <p>
                        <label for="file">Employee Image</label>
                		<input type="file" name="file" />                        
                		<input type="submit" value="upload" />
            			</form>         
                        </p>
          </div>
           
            <div id="view5" >
                  <form>
                  <input type="submit" value="View Financial Reports"/>
                  
                  </form>
                  </div>  
            
            
            
        </div>
        
    </div>
                            
                        
                                                
                            
			 </section>
<!-------------------------------------------------------------------------------------------------------------------------->						
			
				<!-- Contact -->
					<section id="contact" class="five">
						<div class="container">

							<header>
								<h2>Contact</h2>
							</header>

							<p>Enter the Content You want to email to your customer and please type thename of your customer to get your customers email id from our database.</p>
							
							<form method="post" action="#">
								<div class="row half">
									<div class="6u"><input type="text" name="name" placeholder="Name" /></div>
									<div class="6u"><input type="text" name="email" placeholder="Email" /></div>
								</div>
								<div class="row half">
									<div class="12u">
										<textarea name="message" placeholder="Message"></textarea>
									</div>
								</div>
								<div class="row">
									<div class="12u">
										<input type="submit" value="Send Message" />
									</div>
								</div>
							</form>

						</div>
					</section>
			
			</div>

		<!-- Footer -->
			<div id="footer">
				
				<!-- Copyright -->
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="https://www.facebook.com/">Dilshani Kumarapeli</a></li>
					</ul>
				
			</div>
    <script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
var sprytextfield2 = new Spry.Widget.ValidationTextField("sprytextfield2");
    </script>
    
    
      <script>
     
      var userName = "<%= user %>";
        
window.setInterval(function () {loadXMLDoc()}, 2000);
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
    document.getElementById("view6").innerHTML=xmlhttp.responseText;
    }
  }
  
 
xmlhttp.open("GET","../accessdb?user="+userName,true);
xmlhttp.send();
}
</script>

               
	</body>
</html>