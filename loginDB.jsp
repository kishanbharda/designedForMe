<%@ page import="myPackage.*" %>
<%@ page import="java.sql.*" %>

<%
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");

try
{
	ResultSet rs=table.show("Select * from users where MOBILE='"+mobile+"' and PASSWORD='"+password+"'");
	if(rs.next())
	{	
		session.setAttribute("login",rs.getInt(1));
		session.setAttribute("userId",rs.getInt(1));
		ResultSet rsTI=table.show("Select count(*) from cart where USERID="+rs.getInt(1));
		rsTI.next();
		session.setAttribute("totalItems",rsTI.getInt(1));
		%>
		<jsp:forward page="index.jsp"/>
		<%
	}
	else
	{
		%>
		<jsp:forward page="login.jsp?message=<h3 style='color:red'>Sorry !!!Password doesn't match...!" />
		<%	
	}		
}
catch(Exception e)
{
	out.print(e);
}
%>