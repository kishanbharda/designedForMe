<%@ page import="myPackage.*" %>
<%
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");
String confirmPassword=request.getParameter("confirmPassword");
if(!(password.equals(confirmPassword)))
{
	%>
	<jsp:forward page="register.jsp?message=<h3 style='color:red'>Sorry !!! Password does not match...!" />
	<%
}
else
{
	int userId=Integer.parseInt(session.getAttribute("userId").toString());
	boolean res=table.perform("Insert into users values("+userId+",'"+mobile+"','"+password+"')");
	if(res==true)
	{
		%>
		<jsp:forward page="register.jsp?message=<h3 style='color:green'>Registration success...!" />
		<%
	}
	else
	{
		%>
		<jsp:forward page="register.jsp?message=<h3 style='color:red'>Sorry !!! Some error occured...!" />
		<%
	}
}
%>