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
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info col-md-4 col-md-offset-4">
				<div class="panel-heading">
					<h3>Please Login Here<b>|</b></h3>
				</div>
				<div class="panel-body">
					<form method="post" action="checkUser.jsp">
						<div class="form-group">
							<input type="text" name="mobile" class="form-control" placeholder="Mobile" maxlength="10" onKeyPress="return num(event)" required />
						</div>	
						<div class="form-group">
							<input type="password" name="password" class="form-control" placeholder="Password" onKeyPress="return disSpace(event)" required />
						</div>
						<center><button type="submit" class="btn btn-primary">Continue</button></center>
						Not Registered ?<a href="register.jsp" style="color:blue">Register Here</a>
						<%
							if(!(request.getParameter("message")==null))
							{
								out.print(request.getParameter("message"));
							}
						%>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
