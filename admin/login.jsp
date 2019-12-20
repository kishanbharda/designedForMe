<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>designedForMe | DASHBOARD</title>

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
	<div class="container">
		<div class="row">
			<div class="panel">
				<div class="panel-heading">
					
				</div>
				<div class="panel-body">
					<%
						if(request.getParameter("message")!=null)
						{
							out.print(request.getParameter("message"));
						}
					%>
					<div class="panel panel-info col-md-4 col-md-offset-4">
						<h2>Please Login Here |
						<form method="post" action="checkAdmin.jsp">
							</br><input type="text" name="username" class="form-control" placeholder="Username" required />
							</br><input type="password" name="password" class="form-control" placeholder="Password" required />
							</br><center><input type="submit" class="btn btn-primary" value="Login"/></center>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
