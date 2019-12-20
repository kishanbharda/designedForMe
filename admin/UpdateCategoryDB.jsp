<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<%

int id=Integer.parseInt(request.getParameter("id"));
String mainCategory=request.getParameter("mainCategory");
String subCategory=request.getParameter("subCategory");
String pageUrl=request.getParameter("page");


try
{
	boolean result=table.perform("Update category set MAIN_CATEGORY='"+mainCategory+"',SUB_CATEGORY='"+subCategory+"' where ID="+id);
	if(result==true)
	{
		
		%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:green'>Item successfully Updated...!</h3>"/>
			</jsp:forward>
		<%
		
	}
	else
	{
		%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:red'>Sorry !!! Some error occured.</h3>"/>
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