<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<%
int productId=Integer.parseInt(request.getParameter("productId"));
String pageUrl=request.getParameter("pageUrl");

try
{
	boolean result=table.perform("Delete from product where ID="+productId);
	if(result==true)
	{
		%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:green'>Product successfully removed...!</h3>"/>
			</jsp:forward>
		<%
	}
	else
	{
		%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:red'>Sorry !!! Such product doesn't exists.</h3>"/>
			</jsp:forward>
		<%
	}
}
catch(Exception e)
{
	%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:red'><%= e %></h3>"/>
			</jsp:forward>
	<%
}
%>