<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DASHBOARD | Update Category</title>

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
                        <h1 class="page-head-line">Update Category Here </h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h5>Update Category detail here :</h5>
							</div>	
							<div class="panel-body">
								<%! ResultSet rs; %>
								<%! String pageUrl; %>
								<%
									String mainCategory=request.getParameter("mainCategory");
									String subCategory=request.getParameter("subCategory");
									pageUrl=request.getParameter("pageUrl");
									try
									{
										rs=table.show("Select * from category where MAIN_CATEGORY='"+mainCategory+"' and SUB_CATEGORY='"+subCategory+"'");
										if(!(rs.next()))
										{
											%>
												<jsp:forward page="UpdateCategory.jsp?message=<h3 style='color:red'>Sorry!!!Category does not exists.</h3>" />
											<%
										}
									}
									catch(Exception e)
									{
										%>
											<jsp:forward page="UpdateCategory.jsp?message=<h3 style='color:red'><%= e %></h3>" />
										<%
									}
								%>
								<form role="form" method="post" action="UpdateCategoryDB.jsp">
									<div class="form-group">
										<label>ID : </label>
										<input type="text" name="id" class="form-control" readonly value="<%= rs.getInt(1)%>"/>
									</div>
									<div class="form-group">
										<label>Category Name : </label>
										<input type="text" name="subCategory" class="form-control" onKeyPress="return str(event)" value="<%= rs.getString(3) %>"/>
									</div>
									<div class="form-group">
										<label>Select Main Category </label>
										<select class="form-control" name="mainCategory">
											<option value="<%= rs.getString(2) %>" select><%= rs.getString(2) %></option>
											<option value="Men">Men</option>
											<option value="Women">Women</option>
											<option value="Kid">Kid</option>
										</select>
									</div>
									<input type="hidden" name="page" value="<%= pageUrl %>"/>
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
