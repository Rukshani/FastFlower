<!DOCTYPE HTML>
<html>
	<head>
		<title>Driver Description</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="fast flower delivery driver description" />
		<meta name="keywords" content="fast, flower, delivery,driver,description" />
		<meta name="author" content="Rukshani" />
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.poptrox.min.js"></script>
		<script src="js/jquery.scrolly.min.js"></script>
		<script src="js/jquery.scrollgress.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-wide.css" />
			<link rel="stylesheet" href="css/style-normal.css" />
		</noscript>
	</head>
	<body>
			<header id="header">
					<h1 id="logo"><%=session.getAttribute("usermail")%></h1>
					<nav id="nav">
						<ul>
							<li><a href="#intro">Introduction</a></li>
							<li><a href="#one">You</a></li>
							<li><a href="#two">Works</a></li>
							<li><a href="#mobileapp">Mobile App</a></li>
                            <li><a href="#downloads">Downloads</a></li>
							<li><a href="#contact">Contact</a></li>
                            <li><a>
								<form method="post" action="../logoutprocess.jsp">
									<input type="submit" value="Logout">
         						</form>
								</a>
							</li>
						</ul>
					</nav>
			</header>
			

			<section id="intro" class="main style1 dark fullscreen">
				<div class="content container small">
					<header>
						<h2>Hey...</h2>
					</header>
					<p>Welcome to <strong>Fast Flower Delivery System</strong></p>
                    <p>Fast Flower Delivery System is Sri Lanka's largest e-commerce organization. With over 10000 products and distinct services Fast Flower Delivery System has set the bar for e-commerce footprint of Sri Lanka.Our goal is to provide a world class service to Sri Lankan's who shop online.</p>
					<footer>
						<a href="#one" class="button style2 down">More</a>
					</footer>
				</div>
			</section>
		
		<!-- One -->
			<section class="main style2 right dark fullscreen" id="one" name="one">
				<div class="content box style2">
					<header>
						<h2>Who you are?</h2>
					</header>
					<p></p>
				</div>
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>
	
			<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>What you should do?</h2>
					</header>
					<p></p>
				</div>
				<a href="#mobileapp" class="button style2 down anchored">Next</a>
			</section>
			
		<!-- Work -->
			<section id="mobileapp" class="main style3 primary">
				<div class="content container">
					<header>
						<h2>Our Mobile Application</h2>
						<p></p>
					</header>
					
					
						<div class="container small gallery">
							<div class="row flush images">
								<div class="6u"><a href="images/fulls/01.jpg" class="image fit from-left"><img src="images/thumbs/01.png" height="500" width="75"/></a></div>
								<div class="6u"><a href="images/fulls/02.jpg" class="image fit from-right"><img src="images/thumbs/02.png" height="500" width="75"/></a></div>
							</div>
							<div class="row flush images">
								<div class="6u"><a href="images/fulls/03.jpg" class="image fit from-left"><img src="images/thumbs/03.png" height="500" width="75"/></a></div>
								<div class="6u"><a href="images/fulls/04.jpg" class="image fit from-right"><img src="images/thumbs/04.png" height="500" width="75"/></a></div>
							</div>
						</div>

				</div>
			</section>
         
            <div class="main style3 secondary" id="downloads" name="downloads">
            	<div class="content container">
                	<header>
                		<h2>Downloads</h2>
                    </header>
								
						<ul class="actions">
							<li><input type="button" value="Download" /></li>
						</ul>				
                </div>	
            </div>
       
			<section class="main style3 secondary" id="contact" name="contact">
				<div class="content container">
					<header>
						<h2>Contact</h2>
					</header>
					<div class="box container small">
							<form method="post" action="#">
								<div class="row half">
									<div class="6u"><input type="text" name="name" placeholder="Name" /></div>
									<div class="6u"><input type="email" name="email" placeholder="Email" /></div>
								</div>
								<div class="row half">
									<div class="12u"><textarea name="message" placeholder="Message" rows="6"></textarea></div>
								</div>
								<div class="row">
									<div class="12u">
										<ul class="actions">
											<li><input type="submit" value="Send Message" /></li>
										</ul>
									</div>
								</div>
							</form>

					</div>
				</div>
			</section>
			
			<footer id="footer" name="footer">
					<ul class="actions">
						
						<li><a href="https://www.facebook.com" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="https://www.twitter.com" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="https://www.gmail.com" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
					</ul>			
			</footer>

	</body>
</html>