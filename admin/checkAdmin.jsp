<%@ page import="myPackage.*" %>
<%@ page import="java.sql.*" %>

<%
String username=request.getParameter("username");
String password=request.getParameter("password");

ResultSet rs=table.show("Select * from admin where USERNAME='"+username+"' and PASSWORD='"+password+"'");
if(rs.next())
{
	session.setAttribute("admin",true);
	%>
	<jsp:forward page="index.jsp"/>
	<%
}
else
{
	%>
	<jsp:forward page="login.jsp?message=<h2 style='color:red'>Invalid username or password!!!</h2>"/>
	<%
}
%>