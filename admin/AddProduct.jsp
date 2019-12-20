<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DASHBOARD | Add Product</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <script src="assets/js/validation.js"></script>
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
                        <a class="active-menu" href="index.jsp"><i class="fa fa-dashboard "></i>Dashboard</a>
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
                        <h1 class="page-head-line">Add Product Here</h1>
						<%
											if(!(request.getParameter("message")==null))
											{
												out.print(request.getParameter("message"));
											}
						%>
                    </div>
                </div>
                <!-- /. ROW  -->
                
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>Fill the product details.</h4>
							</div>
							<div class="panel-body">
								<form role="form" method="post" action="AddProductDB.jsp" enctype="multipart/form-data">
									<div class="form-group">
										<label>Enter Product Name : </label>
										<input class="form-control" type="text" name="productName" placeholder="Enter product name here" onKeyPress="return str(event)" required>
									</div>
									<div class="form-group">
										<label>Select Main Category : </label>
										<select class="form-control" name="mainCategory">
                                                <option value="Men">Men</option>
                                                <option value="Women">Women</option>
                                                <option value="Kids">Kid</option>
                                        </select>
									</div>
									<div class="form-group">
										<label>Select Sub Category : </label>
										<select class="form-control" name="subCategory">
											<%
												try
												{
													ResultSet rs=table.show("Select SUB_CATEGORY from category");
													while(rs.next())
													{
														%>
															<option value=<%= rs.getString(1) %>><%= rs.getString(1) %></option>
														<%
													}
												}
												catch(Exception e)
												{
													//out.print("<h2 style='color:red'>Sorry !!! Some error occured.</h2>");
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label>Select Size : </label>
										<select class="form-control" name="size">
											<option>S</option>
											<option>M</option>
											<option>L</option>
											<option>XL</option>
											<option>XXL</option>
										</select>
									</div>
									<div class="form-group">
										<label>Enter Color : </label>
										<input type="text" name="color" class="form-control" placeholder="Enter Color Here" onKeyPress="return str(event)" required>
									</div>		
									<div class="form-group">
										<label>Enter Price : </label>
										<input type="text" name="price" class="form-control" placeholder="Enter Price Here" onKeyPress="return num(event)" required>
									</div>
									<div class="form-group">
										<label>Enter Discount : </label>
										<input type="text" name="discount" class="form-control" placeholder="Enter Discount Here" onKeyPress="return num(event)" required>
									</div>
									<div class="form-group">
										<label>Enter Quantity : </label>
										<input type="text" name="quantity" class="form-control" placeholder="Enter Quantity Here" onKeyPress="return num(event)" required>
									</div>
									<div class="form-group">
										<label>Select Image : </label>
										<input class="form-control" name="image" type="file" required">
									</div>
									<div class="form-group">
										<label>Enter Description : </label>
										<textarea class="form-control" rows="3" name="description" placeholder="Enter product description here" required></textarea>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-info">Save</button>
										<button type="reset" class="btn btn-info">Clear</button>
									</div>
								</form>
							</div>	
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
    


</body>
</html>
