<%@ page import="myPackage.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
<body>
<div class="container">
	<div id="wrapper">
		<div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">INVOICE </h1>
					</div>
                </div>
				<hr>
                <!-- /. ROW  -->
                <div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-6">	
								
										<b><h1 style="font-family:Jokerman">designedForMe</h1></b>
								
							</div>
							<div class="col-md-6" style="text-align:right">
								<strong>designedForMe LLC.</strong>
								<br />
								College Road,
								<br />
								Junagadh-362001,
								</br>
								Gujarat,
								<br />
								India.
							</div>
						</div>
					</div>
					<hr>
					<div  class="row text-center contact-info">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="row">
								<div class="col-md-4">
									<strong>E-mail : </strong>designedForMe@info.com
								</div>
								<div class="col-md-4">
									<strong>Phone : </strong>+91 834-797-2540
								</div>
								<div class="col-md-4">
									<strong>Fax : </strong>+012340-908- 890 
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div  class="row pad-top-botm client-info">
						<div class="row">
							<div class="col-md-6">
							<%
							int userId=Integer.parseInt(session.getAttribute("userId").toString());
								ResultSet rsaddr=table.show("Select * from address where USERID="+userId);
								rsaddr.next();
							%>
								<h4>  <strong>Client Information</strong></h4>
									<strong><%= rsaddr.getString(2) %></strong>
									<br />
									<b>Address :</b><%= rsaddr.getString(5) %>
									</br>
									<b>Call :</b> <%= rsaddr.getString(3) %>
									<br />
									
							</div>
							<div class="col-md-6" style="text-align:right">
							<%
								ResultSet rsBill=table.show("select sum(TOTAL) from orders where USERID="+userId);
								rsBill.next();
							%>
							   <h4>  <strong>Payment Details </strong></h4>
								<b>Bill Amount : </b> Rs.<%= rsBill.getInt(1) %>
								<br />
								<b>Bill Date : </b><%= new java.util.Date() %>
								<br />
								<b>Payment Status :</b>  UnPaid 
								<br />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
									<tr>
												<th>Item Name</th>
												<th>Size</th>
												<th>Price</th>
												<th>Discount</th>
												<th>Quantity</th>
												 <th>Total</th>
											</tr>
										</thead>
										<tbody>
											<%
												ResultSet rsData=table.show("Select ITEM_NAME,SIZE,PRICE,DISCOUNT,QUANTITY,TOTAL from orders where USERID="+userId);
												while(rsData.next())
												{
													%>
													<tr>
														<td><%= rsData.getString(1) %></td>
														<td><%= rsData.getString(2) %></td>
														<td><%= rsData.getInt(3) %></td>
														<td><%= rsData.getInt(4) %></td>
														<td><%= rsData.getInt(5) %></td>
														<td><%= rsData.getInt(6) %></td>
													</tr>
													<%
												}
											%>
										</tbody>
									</table>
								</div>
								<hr />
								<div class="ttl-amts">
									<h5>  Total Amount : Rs.<%= rsBill.getInt(1) %></h5>
								</div>
								<hr />
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<strong> Important: </strong>
								<ol>
								  <li>
									This is an electronic generated invoice so doesn't require any signature.
								  </li>
								  <li>
									 Please read all terms and polices on  www.yourdomaon.com for returns, replacement and other issues.
           						 </li>
							    </ol>
							</div>
						</div>
						<div class="row pad-top-botm">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<hr />
								<a href="index.jsp" class="btn btn-success btn-lg" >Home</a>
							</div>
						</div>
					</div>
				</div>
            </div>
		</div>
        <!-- /. PAGE INNER  -->
		</div>
	</div>
<div>
</body>
</html>
