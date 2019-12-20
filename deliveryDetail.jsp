<% 
if(session.getAttribute("login")==null)
{
	%>
	<jsp:forward page="loginForOrder.jsp"/>
	<%
}
else
{
	%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>designedForMe | Delivery Detail</title>
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
			<div class="panel panel-info">
				<div class="panel-heading">
					<h2>Delivery Detail | <span style="color:red">Note : Only cash-on delivery is available.</h2>
				</div>
				<div class="panel-body">
					<form method="post" action="addAddress.jsp">
						<div class="form-group">
							<input type="text" name="fullName" class="form-control" placeholder="Enter Full Name here" onKeyPress="return fn(event)" required />
						</div>
						<div class="form-group">
							<input type="text" name="mobile" class="form-control" maxlength="10" placeholder="Enter Mobile number here" onKeyPress="return num(event)" required />
						</div>
						<div class="form-group">
							<input type="text" name="pincode" class="form-control" maxlength="6" onKeyPress="return num(event)" placeholder="Enter Pincode here" required />
						</div>
						<div class="form-group">
							<textarea name="address" class="form-control" placeholder="Enter Full Address here" required ></textarea>
						</div>
						<div class="form-group">
							<input type="text" name="city" class="form-control" placeholder="Enter City here" onKeyPress="return str(event)" required />
						</div>
						<div class="form-group">
							<input type="text" name="state" class="form-control" placeholder="Enter State here" onKeyPress="return str(event)" required />
						</div>
						<div class="form-group">
							<center><button type="submit" class="btn btn-primary">Continue</button></center>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%
}
%>