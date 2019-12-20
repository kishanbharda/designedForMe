<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DASHBOARD | View Category</title>

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
						<%
							if(!(request.getParameter("message")==null))
							{
								out.print(request.getParameter("message"));
							}				
						%>
                        <h1 class="page-head-line">Category</h1>
                    </div>
                </div>
                <!-- /. ROW  -->
                
				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header">
								<div class="box-tools">
									<div class="input-group input-group-sm pull-right" style="width:200px;">
										<input type="text" name="table_search" class="form-control pull-right" id="myInput" onKeyup="search()" placeholder="Search">
										<div class="input-group-btn">
											<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
										</div>
									</div>
								</div>
							</div>
							
							<!-- /.box-header -->
							
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover" id="categoryTable">
									<tr>
										<th>ID</th>
										<th>Main Category</th>
										<th>Sub Category</th>
									</tr>
									<%
										try
										{
											Class.forName("com.mysql.jdbc.Driver");
											java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost/dforme","root","");
											
											PreparedStatement pst=con.prepareStatement("Select * from category");
											ResultSet rs=pst.executeQuery();
											while(rs.next())
											{
												%>
													<tr>
														<td><%= rs.getInt(1) %></td>
														<td><%= rs.getString(2) %></td>
														<td><%= rs.getString(3) %></td>
														<td><a href="UpdateCategoryDetail.jsp?mainCategory=<%= rs.getString(2) %>&&subCategory=<%= rs.getString(3) %>&&pageUrl=ViewCategory.jsp"><button type="button" class="btn btn-info"><i class="fa fa-edit"></i></button></a></td>
														<td><a href="RemoveCategoryDB.jsp?mainCategory=<%= rs.getString(2) %>&&subCategory=<%= rs.getString(3) %>&&pageUrl=ViewCategory.jsp"><button type="button" class="btn btn-danger"><i class="fa fa-remove"></i></button></a></td>
													</tr>
												<%
											}
										}
										catch(Exception e)
										{
											out.println(e);
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
				
				table=document.getElementById("categoryTable");
				tr=table.getElementsByTagName("tr");
				
				
				for(i=0;i<tr.length;i++)
				{
					td=tr[i].getElementsByTagName("td")[1];
					td1=tr[i].getElementsByTagName("td")[2];
					if(td)
					{
						if((td.innerHTML.toUpperCase()==filter) || (td1.innerHTML.toUpperCase().indexOf(filter)>-1))
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
