<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<%
	if(session.getAttribute("login")==null)
	{
		%>
		<jsp:forward page="contact-us.jsp?message=<h3 style='color:red'>Please login first...!" />
		<%
	}
	else
	{
		int userId=Integer.parseInt(session.getAttribute("userId").toString());
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String email=request.getParameter("email");
		String msg=request.getParameter("feedback");
		
		boolean res=table.perform("Insert into feedback values("+userId+",'"+firstName+"','"+lastName+"','"+email+"','"+msg+"')");
		if(res)
		{
			%>
				<jsp:forward page="contact-us.jsp?message=<h3 style='color:green'>Feedback successfully sent...!" />
			<%
		}
		else
		{
			%>
				<jsp:forward page="contact-us.jsp?message=<h3 style='color:red'>Failed...!" />
			<%
		}
	}
%>	
