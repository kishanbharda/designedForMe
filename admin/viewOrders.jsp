<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DASHBOARD | View Orders</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">designed For Me</a>
            </div>

            <div class="header-right">
                <a href="login.jsp"><button class="btn btn-danger">Logout</button></a>
			</div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
						<hr>
					<li>
                    <li>
                        <a href="index.jsp" class="active-menu"><i class="fa fa-dashboard "></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="#">Product <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="AddProduct.jsp">Add Product</a>
                            </li>
                            <li>
                                <a href="RemoveProduct.jsp">Remove Product</a>
                            </li>
                             <li>
                                <a href="UpdateProduct.jsp">Update Product</a>
                            </li>
                             <li>
                                <a href="ViewProduct.jsp">View Product</a>
                            </li>                             
                        </ul>
                    </li>
                    <li>
                        <a href="#">Category <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="AddCategory.jsp">Add Category</a>
                            </li>
                            <li>
                                <a href="RemoveCategory.jsp">Remove Category</a>
                            </li>
                             <li>
                                <a href="UpdateCategory.jsp">Update Category</a>
                            </li>
                             <li>
                                <a href="ViewCategory.jsp">View Category</a>
                            </li>                             
                        </ul>
                    </li>
					<li>
						<a href="viewOrders.jsp">View Orders</a>
					</li>
					<li>
						<a href="viewUsers.jsp">View Users</a>
					</li>
					<li>
						<a href="viewFeedbacks.jsp">View Feedback</a>
					</li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Orders</h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                
				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header">
								<div class="box-tools">
									<div class="input-group input-group-sm pull-right" style="width:200px;">
										<input type="text" name="table_search" class="form-control pull-right" id="myInput" onKeyup="search()" placeholder="Search Here">
									</div>
								</div>
							</div>
							
							<!-- /.box-header -->
							
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover" id="ordersTable">
									<tr>
										<th>User ID</th>
										<th>Full Name</th>
										<th>Mobile</th>
										<th>Pincode</th>
										<th>Full Address</th>
										<th>City</th>
										<th>State</th>
										<th>Item ID</th>
										<th>Item Name</th>
										<th>Size</th>
										<th>Price</th>
										<th>Discount</th>
										<th>Quantity</th>
										<th>Total</th>
									</tr>
									<%
										ResultSet rs=table.show("select address.USERID,address.FULLNAME,address.MOBILE,address.PINCODE,address.FULL_ADDRESS,address.CITY,address.STATE,orders.ITEM_ID,orders.ITEM_NAME,orders.SIZE,orders.PRICE,orders.DISCOUNT,orders.QUANTITY,orders.TOTAL from orders inner join address on orders.USERID=address.USERID");
										while(rs.next())
										{
											%>
												<tr>
													<td><%= rs.getInt(1) %></td>
													<td><%= rs.getString(2) %></td>
													<td><%= rs.getString(3) %></td>
													<td><%= rs.getString(4) %></td>
													<td><%= rs.getString(5) %></td>
													<td><%= rs.getString(6) %></td>
													<td><%= rs.getString(7) %></td>
													<td><%= rs.getInt(8) %></td>
													<td><%= rs.getString(9) %></td>
													<td><%= rs.getString(10) %></td>
													<td><%= rs.getInt(11) %></td>
													<td><%= rs.getInt(12) %></td>
													<td><%= rs.getInt(13) %></td>
													<td><%= rs.getInt(14) %></td>
												</tr>
											<%
										}
									%>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
                
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->

    <div id="footer-sec">
        &copy; 2017 designedForMe | Design By : Bharda K L
    </div>
    <!-- /. FOOTER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
	<script>
		function search()
		{
			
				var input,filter,table,tr,td,i;
				input=document.getElementById("myInput");				
				filter=input.value.toUpperCase();
				
				table=document.getElementById("ordersTable");
				tr=table.getElementsByTagName("tr");
				
				
				for(i=0;i<tr.length;i++)
				{
					td=tr[i].getElementsByTagName("td")[1];
					tdId=tr[i].getElementsByTagName("td")[0];
					if(td)
					{
						if(td.innerHTML.toUpperCase().indexOf(filter)>-1 || tdId.innerHTML.toUpperCase().indexOf(filter)>-1)
						{
							tr[i].style.display="";
						}
						else
						{
							tr[i].style.display="none";
						}
					}
				}
				
		}
	</script>


</body>
</html>
