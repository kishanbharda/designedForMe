<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<%! Connection con=connection.getCon();%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>About Us | designedForMe</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->   
	<script src="js/validation.js"></script>
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
<body>
    <header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h3>designedForMe</h3>
				<form method="post" action="search.jsp">
					<div class="form-group input-group">
						<input type="text" class="form-control" name="text" placeholder="Search Here" onKeyPress="return str(event)" required />
						<span class="input-group-addon"><a href="#"><button type="submit" type="btn btn-primary"><span class="icon-search"></span></a></button></span>
					</div>
				</form>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp">Home</a></li>                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mens <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                           <%
								try
								{
									Class.forName("com.mysql.jdbc.Driver");
									java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dforme","root","");
									
									PreparedStatement pst=con.prepareStatement("Select SUB_CATEGORY from product where MAIN_CATEGORY='Men' group by SUB_CATEGORY");
									ResultSet rs=pst.executeQuery();
									while(rs.next())
									{
										%>
										<li><a href="product.jsp?mainCategory=Men&&subCategory=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></li>
										<%
									}
								}
								catch(Exception e)
								{
									out.print(e);
								}
							%>
						</ul>
                    </li>
					<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Womens <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                           <%
								try
								{
									Class.forName("com.mysql.jdbc.Driver");
									java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dforme","root","");
									
									PreparedStatement pst=con.prepareStatement("Select SUB_CATEGORY from product where MAIN_CATEGORY='Women' group by SUB_CATEGORY");
									ResultSet rs=pst.executeQuery();
									while(rs.next())
									{
										%>
										<li><a href="product.jsp?mainCategory=Women&&subCategory=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></li>
										<%
									}
								}
								catch(Exception e)
								{
									out.print(e);
								}
							%>
                        </ul>
                    </li>
					<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Kids <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <%
								try
								{
									Class.forName("com.mysql.jdbc.Driver");
									java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dforme","root","");
									
									PreparedStatement pst=con.prepareStatement("Select SUB_CATEGORY from product where MAIN_CATEGORY='Kid' group by SUB_CATEGORY");
									ResultSet rs=pst.executeQuery();
									while(rs.next())
									{
										%>
										<li><a href="product.jsp?mainCategory=Kid&&subCategory=<%= rs.getString(1) %>"><%= rs.getString(1) %></a></li>
										<%
									}
								}
								catch(Exception e)
								{
									out.print(e);
								}
							%>
                        </ul>
                    </li>
					<li class="active"><a href="about-us.jsp">About Us</a></li>
                    <li><a href="contact-us.jsp">Contact</a></li>
					<%
					if(session.getAttribute("login")==null)
					{
						%>
					<li><a href="register.jsp">Sing Up</a></li>                    
					<li><a href="login.jsp">Login</a></li>                    
						<%
					}
					else
					{
						%>
					<li><a href="logout.jsp">Logout</a></li>                    
						<%
					}
					%>
					<li><a href="cart.jsp">Cart<div class="badge" id="cartItems"><%= session.getAttribute("totalItems") %></div></a></li>
                </ul>
            </div>
        </div>
    </header><!--/header-->

    <section id="title" class="emerald">
        <div class="container" style="margin-top:40px;">
            <div class="row">
                <div class="col-sm-6">
                    <h1>About Us</h1>
                    
                </div>
                <div class="col-sm-6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">About Us</li>
                    </ul>
                </div>
            </div>
        </div>
    </section><!--/#title-->

    <section id="about-us" class="container">
        <div class="row">
            <div class="col-sm-6">
                <h2>What we are</h2>
                <p>designedForMe is a one stop shop for all your fashion and lifestyle needs.
				Being India's largest e-commerce store for fashion and lifestyle product.
				designedForMe aims at providing a hassle free and enjoyable shopping experience to 
				shoppers across the country with the widest range of brands and products on its portal.
				The brand is making a conscious effrots to bring the power of fashion to shoppers with 
				an array of the latest and trendiest products available in the country.</p>
            </div><!--/.col-sm-6-->
            <div class="col-sm-6">
                <h2>Value Proposition</h2>
                <p>
				designedForMe value proposition revolves arounding giving consumers the 
				power and ease of purchasing fashion and lifestyle products online.
				Offerings such as the largest ins-session product catalogue,100% authentic products
				cash on delivery and 30 day return policy make designedForMe,the preferred shopping
				destination in the country.
				To macke online shopping easier for you, a dedicated customer connect team is on standby
				answer your queries 24*7.
				</p>
            </div><!--/.col-sm-6-->
        </div><!--/.row-->
		<div class="row">
			<div class="col-sm-6">
				<h2>Brands</h2>
				<p>
					designedForMe understands its shoppers' needs and caters to then with choice of apperel,
					accessories,cosmetics from over 500 leading Indian and international brands.
					Prominent brands include Adidas,Nike,Puma,Catwalk,Inc 5,United Color of Benetton,FCUK,
					Timberland,Avirate,FabIndia and Biba to name a few.
					You can alse shop for some recently introduced labels such as -Roadster,SherSingh,
					Dressberry,Kook N Keech and ETC.
				</p>
			</div>
			<div class="col-sm-6">
				<h2>Recognitions</h2>
				<li>Awarded <b>Fashion eRetailer of the year 2014'</b> by Franchise India-Indian eRetail Awards</li>
				<li>Awarded <b>'Best E-commerce Website for 2012'</b> by IAMAI-India Digital Awards</li>
				<li>Awarded <b>'Images Most Admired Retailer of the Year:Mon-Store  Retail'</b> for 2012 by Image Group</li>
				<li>Awarded <b>'Best E-commerce Partner of the year 2011-12'</b> by Puma India
			</div>
        </div>
    </section><!--/#about-us-->

    <section id="bottom" class="wet-asphalt">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <h4>About Us</h4>
                    <p>We provide a way for buying lots of clothes online from our web site.It is simple and secure.We provide the best qualititive product.</p>
                    <p>designedForMe is make your shopping easiest.</p>
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <h4>Any Query?</h4>
                    <p>We have larger collection of the branded product.We sells only the best products to the our customers.</p>
					<p>If any complain,please suggest us at dforme@gmail.com. We helps you any time.</p>
					<p>Please feedback your suggestion to us,so we can provide the best service to you.</p>
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <h4>Connect With Us</h4>
                    <div>
                        <div class="media">
                            <div class="pull-left">
                                <i class="icon-twitter icon-md"></i>
                            </div>
                            <div class="media-body">
                                <br/><span class="media-heading"><a href="#">@designedForMe</a></span>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <i class="icon-facebook icon-md"></i>
                            </div>
                            <div class="media-body">
                               <br/><span class="media-heading"><a href="#">@designedForMe</a></span>
                            </div>
                        </div>
                        <div class="media">
                            <div class="pull-left">
                                <i class="icon-google-plus icon-md"></i>
                            </div>
                            <div class="media-body">
                               <br/><span class="media-heading"><a href="#">@designedForMe</a></span>
						   </div>
                        </div>
                    </div>  
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                    <h4>Address</h4>
                    <address>
                        <strong>designedForMe</strong><br>
                        College Road, Suite 600<br>
                        Junagadh-362001,Gujarat<br>
                        <abbr title="Phone">P:</abbr> +91 834-797-2540
                    </address>
                </div> <!--/.col-md-3-->
            </div>
        </div>
    </section><!--/#bottom-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2017 designedForMe. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="contact-us.jsp">Contact Us</a></li>
                        <li><a id="gototop" class="gototop" href="#"><i class="icon-chevron-up"></i></a></li><!--#gototop-->
                    </ul>
                </div>
            </div>
        </div>
    </footer><!--/#footer-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>