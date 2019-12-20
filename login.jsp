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
    <title>Login| designedForMe</title>
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
					<li><a href="about-us.jsp">About Us</a></li>
                    <li><a href="contact-us.jsp">Contact</a></li>
					<li><a href="register.jsp">Sing Up</a></li>                    
					<li class="active"><a href="login.jsp">Login</a></li>                    
					<li><a href="cart.jsp">Cart<div class="badge" id="cartItems"><%= session.getAttribute("totalItems") %></div></a></li>
					
                </ul>
            </div>
        </div>
    </header><!--/header-->

    <section id="title" class="emerald">
        <div class="container" style="margin-top:40px;">
            <div class="row">
                <div class="col-sm-6">
                    <h1>Login Here | </h1>
                    <p>To get the best service from us please Login first...!</p>
                </div>
                <div class="col-sm-6">
                    <ul class="breadcrumb pull-right">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Login</li>
                    </ul>
                </div>
            </div>
        </div>
    </section><!--/#title-->    

    <section id="login_form">
		<div class="container">
			<div class="row text-center " style="padding-top:0px;">
				<div class="col-md-12">
					<h1><b>Login Here</b></h1>
				</div>
			</div>
			
			<div class="row ">
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                    <div class="panel-body">
                        <form role="form" method="post" action="loginDB.jsp">
							<hr />
                            <h5>Enter Details to Login</h5>
                            <br />
                            <div class="form-group input-group">
								<span class="input-group-addon"><i class="icon-user"  ></i></span>
								<input type="text" class="form-control" name="mobile" placeholder="Mobile" maxlength="10" onKeyPress="return num(event)" required />
                            </div>
                            
							<div class="form-group input-group">
                                <span class="input-group-addon"><i class="icon-lock"  ></i></span>
                                <input type="password" class="form-control" name="password"  placeholder="Password" onKeyPress="return disSpace(event)" required />
                            </div>
                                     
							<button type="submit" class="btn btn-primary">Login Now</button>
                            <hr />
							
                            Not register ? <a href="register.jsp" style="color:blue">click here To Register</a> or go to <a href="index.jsp" style="color:blue">Home</a> 
                        </form>
						<%
							if(!(request.getParameter("message")==null))
							{
								out.print(request.getParameter("message"));
							}
						%>
                    </div>     
                </div>
			</div>
		</div>
	</section>

    <section id="bottom" class="wet-asphalt">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <h4>About Us</h4><p>We provide a way for buying lots of clothes online from our web site.It is simple and secure.We provide the best qualititive product.</p>
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
                        <li><a href="about-us.jsp">About Us</a></li>
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