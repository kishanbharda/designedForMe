<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DASHBOARD | Update Product</title>

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
                        <h1 class="page-head-line">Update Product Here</h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>Select the product details to update it.</h4>
							</div>
							<div class="panel-body">
								<%! ResultSet rsP; %>
								<%! String pageUrl; %>
								<%
									int id=Integer.parseInt(request.getParameter("productId"));
									pageUrl=request.getParameter("pageUrl");
									
									ResultSet rsP=table.show("Select * from product where ID="+id);
									if(!(rsP.next()))
									{
										%>
											<jsp:forward page="UpdateProduct.jsp?message=<h3 style='color:red'>Sorry!!!Category does not exists.</h3>" />
										<%
									}
								%>
								<form role="form" method="post" action="UpdateProductDB.jsp" enctype="multipart/form-data">
									<div class="form-group">
										<label>Id : </label>
										<input type="text" name="id" class="form-control" onKeyPress="return num(event)" value="<%= rsP.getInt(1) %>" readonly/>
									</div>
									<div class="form-group">
										<label>Product Name : </label>
										<input class="form-control" type="text" name="productName" value="<%= rsP.getString(2) %>" placeholder="Enter product name here" required>
									</div>
									<div class="form-group">
										<label>Main Category : </label>
										<select class="form-control" name="mainCategory">
												<option value="<%= rsP.getString(3) %>" select><%= rsP.getString(3) %></option>
                                                <option value="Men">Men</option>
                                                <option value="Women">Women</option>
                                                <option value="Kids">Kids</option>
                                        </select>
									</div>
									<div class="form-group">
										<label>Sub Category : </label>
										<select class="form-control" name="subCategory">
											<%
												try
												{
													ResultSet rs=table.show("Select SUB_CATEGORY from category");
													while(rs.next())
													{
														%>
															<option value="<%= rsP.getString(4) %>" select><%= rsP.getString(4) %></option>
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
										<label>Size : </label>
										<select class="form-control" name="size">
											<option value="<%= rsP.getString(5) %>" select><%= rsP.getString(5) %></option>
											<option>S</option>
											<option>M</option>
											<option>L</option>
											<option>XL</option>
											<option>XXL</option>
										</select>
									</div>
									<div class="form-group">
										<label>Color : </label>
										<input type="text" name="color" class="form-control" onKeyPress="return str(event)" value="<%= rsP.getString(6) %>" placeholder="Enter Color Here" required>
									</div>		
									<div class="form-group">
										<label>Price : </label>
										<input type="text" name="price" class="form-control" onKeyPress="return num(event)" value="<%= rsP.getInt(7) %>" placeholder="Enter Price Here" required>
									</div>
									<div class="form-group">
										<label>Discount : </label>
										<input type="text" name="discount" class="form-control" onKeyPress="return num(event)" value="<%= rsP.getInt(8) %>" placeholder="Enter Discount Here" required>
									</div>
									<div class="form-group">
										<label>Quantity : </label>
										<input type="text" name="quantity" class="form-control" onKeyPress="return num(event)" value="<%= rsP.getInt(9) %>" placeholder="Enter Quantity Here" required>
									</div>
									<div class="form-group">
										<label>Image : </label>
										<img src="../images/product/<%= rsP.getString(10) %>" height=150/>
										<input type="hidden" name="oldImage" value="<%= rsP.getString(10) %>" />
										<input class="form-control" name="image" type="file" required"><%= rsP.getString(10) %></input>
									</div>
									<div class="form-group">
										<label>Description : </label>
										<textarea class="form-control" rows="3" name="description" placeholder="Enter product description here" required><%= rsP.getString(11) %></textarea>
									</div>
									<input type="hidden" name="pageUrl" value="<%= pageUrl %>"/>
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
		</div>
                
    </div>
    
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
