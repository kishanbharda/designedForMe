<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>
<%@ page import="java.util.*" %>

<%! Connection con=connection.getCon();%>
<%
int totalItems=0;

if(session.isNew())
{
	Random rdm=new Random();
	int tmp=rdm.nextInt(100000);
	session.setAttribute("userId",tmp);
	session.setAttribute("totalItems",totalItems);
	
}
session.setAttribute("buy",false);

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>designedForMe</title>
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
                    <li class="active"><a href="index.jsp">Home</a></li>                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mens <i class="icon-angle-down"></i></a>
                        <ul class="dropdown-menu">
							<%
								try
								{
									
									ResultSet rs=table.show("Select SUB_CATEGORY from product where MAIN_CATEGORY='Men' group by SUB_CATEGORY");
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
									ResultSet rs=table.show("Select SUB_CATEGORY from product where MAIN_CATEGORY='Women' group by SUB_CATEGORY");
									
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
									ResultSet rs=table.show("Select SUB_CATEGORY from product where MAIN_CATEGORY='Kid' group by SUB_CATEGORY");
									
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
	
   <div id="carousel-example-1" class="carousel slide" data-ride="carousel" style="margin-top:80px;">
	<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-1" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-1" data-slide-to="1"></li>
			<li data-target="#carousel-example-1" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active"><a href="#"><img src="images\slider\bg1.jpg" style="height:300px;width:100%;"></a></div>
			<div class="item"><a href="#"><img src="images\slider\bg2.jpg" style="height:300px;width:100%;"></a></div>
			<div class="item"><a href="#"><img src="images\slider\bg3.jpg" style="height:300px;width:100%;"></a></div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-1" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#carousel-example-1" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>

	<section id="new_ariaval">
		<div class="container">
			<div class="row" style="border:2px solid rgb(195,195,195)">
				<div class="col-md-3">
					<div class="panel" style="margin-top:50%;">
						<h1> <center>New Ariaval</center></h1>
						<p style="margin:20px">THIS IS THE OUR NEW PRODUCTS.IT IS DESIGNED BY THE OUR BEST DESIGNER.</p>
					</div>
				</div>
				<%
							
							ResultSet rs=table.show("Select * from product where QUANTITY>0 order by ID desc limit 15");
							while(rs.next())
							{
								%>
						<div class="col-md-3" style="margin-top:40px;">
							<div class="panel panel-primary">
								<div class="panel-heading" style="height:100px">
									<h3><%= rs.getString(2) %></h3>
								</div>
								<div class="panel-body">
									<a href="productDetail.jsp?id=<%= rs.getInt(1) %>"><center><img class="img img-responsive thumbnail" src="images/product/<%= rs.getString(10) %>" style="height:200px"/></center></a>
									<div class="panel" style="height:40px">
										<%
											if(rs.getInt(8)!=0)
											{
												%>
												<h4><span style="color:rgb(0,0,200)">Price : </span><strike style="color:red">Rs.<%= rs.getInt(7) %></strike>&nbsp;<span style="color:rgb(0,200,0)">Rs.<%=  rs.getInt(7)-rs.getInt(8) %></span></h4>
												</h3><span style="color:rgb(46,4,170)"><%= (100*rs.getInt(8))/rs.getInt(7) %>% off</span></h3>
												<%
											}
											else
											{
												%>
												<h4><span style="color:rgb(0,0,200)">Price : </span><span style="color:rgb(0,200,0)"><%= rs.getInt(7) %></span></h4>
												
												<%
											}
										%>
									</div>
								</div>
								<div class="panel-footer">
									<center>
									<a href="productDetail.jsp?id=<%= rs.getInt(1) %>"><button type="button" class="btn btn-info">Buy</button></a>
									
									<%
									ResultSet rsInCart=table.show("Select ITEM_ID from cart where ITEM_ID="+rs.getInt(1)+" and USERID="+Integer.parseInt(session.getAttribute("userId").toString()));
									if(!rsInCart.next())
									{
										%>
									
									
									<button type="button" id="<%= rs.getInt(1) %>" class="btn btn-info" onClick="addToCart(this.id)">Add to Cart</button>
									</center>
										<%
									}
									%>
								</div>
								
							</div>
							<script>
								function addToCart(id)
								{
									document.getElementById(id).style.display="none";
									var xmlhttp=new XMLHttpRequest();
									xmlhttp.onreadystatechange=function(){
										if(this.readyState==4 && this.status==200){
											document.getElementById("cartItems").innerHTML=this.responseText;
										}
									};
									
									xmlhttp.open("GET","addToCart.jsp?id="+id,true);
									xmlhttp.send();
									
								}
							</script>
						</div>
								<%
							}
							
						%>
				
			</div>
		</div>
	</section>
	
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
                        <li><a href="#">Home</a></li>
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