<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart| designedForMe</title>
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
					<li><a href="cart.jsp" class="active">Cart<div class="badge" id="cartItems"><%= session.getAttribute("totalItems") %></div></a></li>
                </ul>
            </div>
        </div>
    </header><!--/header-->
	
	<section id="cart">
		<div class="container" style="padding-top:50px">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3><b>Your Cart</b></h3>
						</div>
						<div class="panel-body">
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover" name="cart" id="tableCart">
									
									<th>Item Name</th>
									<th>Image</th>
									<th>Size</th>
									<th>Price</th>
									<th>Discount</th>
									<th>Quantity</th>
									<th>Total</th>
									<th>Remove</th>
									<% 
										int userId=Integer.parseInt(session.getAttribute("userId").toString());
										ResultSet rsCart=table.show("Select * from cart where USERID="+userId);
										int i=1;
										while(rsCart.next())
										{
											%>
											<tr>
												<td><%= rsCart.getString(3) %></td>
												<td><img class="img img-responsive" height="100" width="100" src="images\product\<%= rsCart.getString(4) %>"/></td>
												<td>
													<select class="form-control" onChange="updateSize(this)">
														<option value="S">S</option>
														<option value="M" selected>M</option>
														<option value="L">L</option>
														<option value="XL">XL</option>
														<option value="XXL">XXL</option>
													</select>
												</td>
												<td><%= rsCart.getInt(6) %></td>
												<td><%= rsCart.getInt(7) %></td>
												<td><input type="text" value="<%= rsCart.getInt(8) %>" class="form-control" id="<%= i %>" onChange="setTotal(this.id)" onKeyPress="return num(event)"/></td>
												<td><%= rsCart.getInt(9) %></td>
												<td><input class="btn btn-danger" type="button" onClick="removeRow(this)" value="Remove"/></td>
											</tr>
											<%
											i++;
										}
									%>
									
								</table>
								<div id="temp" style="color:red;font-size:48px">
								
								</div>
								<script>
									function setTotal(id)
									{
										if(document.getElementById(""+id).value=="")
										{	
											alert("Please enter quantity");
											document.getElementById(""+id).focus();
											return false;
										}
										else
										{
										var price=parseInt(document.getElementById("tableCart").rows[id].cells[3].innerHTML);
										var discount=parseInt(document.getElementById("tableCart").rows[id].cells[4].innerHTML);
										var quantity=parseInt(document.getElementById(""+id).value);
										
										var itemName=document.getElementById("tableCart").rows[id].cells[0].innerHTML;
										var total=0;
										total=(price-discount)*quantity;
										
										document.getElementById("tableCart").rows[id].cells[6].innerHTML=""+total;
										
										var xmlhttp=new XMLHttpRequest();
										var xmlhttp=new XMLHttpRequest();
										xmlhttp.onreadystatechange=function(){
											if(this.readyState==4 && this.status==200){
												document.getElementById("cartTotal").innerHTML=this.responseText;											
											}
										};
										
										xmlhttp.open("GET","updateCartQuantity.jsp?itemName="+itemName+"&quantity="+quantity+"&total="+total,true);
										xmlhttp.send();
										//location.reload();
										}
									}
									function update()
									{
										
										var table=document.getElementById("tableCart");
										var tr=table.getElementsByTagName("tr");
										var i=1;
										var totalAmount=0;
										var totalItems=0;
										for(i=1;i<tr.length;i++)
										{
											var quantity=parseInt(document.getElementById(i).value);
											totalItems=totalItems+quantity;
											var total=parseInt(document.getElementById("tableCart").rows[i].cells[6].innerHTML);
											totalAmount=totalAmount+total;
										}
										document.getElementById("ta").innerHTML=""+totalAmount;
										document.getElementById("toi").innerHTML=""+totalItems;
										
									}
									function removeRow(r)
									{
										
										var i=r.parentNode.parentNode.rowIndex;
										var itemName=document.getElementById("tableCart").rows[i].cells[0].innerHTML;
										
										document.getElementById("tableCart").deleteRow(i);
										var lbl=parseInt(document.getElementById("cartItems").innerHTML);
										lbl--;
										document.getElementById("cartItems").innerHTML=lbl;
										var xmlhttp=new XMLHttpRequest();
										xmlhttp.onreadystatechange=function(){
											if(this.readyState==4 && this.status==200){
												document.getElementById("cartTotal").innerHTML=this.responseText;
												
											}
										};
											
										xmlhttp.open("GET","deleteFromCart.jsp?itemName="+itemName,true);
										xmlhttp.send();
									}
									function updateSize(r)
									{
										var i=r.parentNode.parentNode.rowIndex;
										var itemName=document.getElementById("tableCart").rows[i].cells[0].innerHTML;
										var xmlhttp=new XMLHttpRequest();
										var xmlhttp=new XMLHttpRequest();
										xmlhttp.onreadystatechange=function(){
											if(this.readyState==4 && this.status==200){
												
											}
										};
										
										xmlhttp.open("GET","updateSize.jsp?itemName="+itemName+"&size="+r.value,true);
										xmlhttp.send();
									}
								</script>
							</div>
						</div>
						<div class="panel-footer">
							<div class="row" id="cartTotal">
								
								<div class="col-md-6" style="background-color:#ccff99">
									<h3><b>Total Items : </b>
									<%
										int ui=Integer.parseInt(session.getAttribute("userId").toString());
										ResultSet rs=table.show("Select sum(QUANTITY) from cart where USERID="+ui);
										rs.next();
										out.print(rs.getInt(1));
									%>
									</h3>
								</div>
								<div class="col-md-6" style="background-color:#22ff99">
									<h3><b>Total Amount : </b>
									<%
										
										ResultSet rst=table.show("Select sum(TOTAL) from cart where USERID="+ui);
										rst.next();
										out.print(rst.getInt(1));
									%>
									</h3>
								</div>
								
								
							</div>
							<div class="row">
								<div class="col-md-12">
									<%
										if(Integer.parseInt(session.getAttribute("totalItems").toString())!=0)
										{
											%>
										<a href="deliveryDetail.jsp"><button type="button" class="btn btn-info btn-md pull-right" id="pc">Proceed to Ckeckout</button></a>
											<%
										}
									%>
								</div>
							</div>
						</div>
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