<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>


<%
String mainCategory=request.getParameter("mainCategory");
String subCategory=request.getParameter("subCategory");
String pageUrl=request.getParameter("pageUrl");

try
{
	boolean result=table.perform("Delete from category where MAIN_CATEGORY='"+mainCategory+"' and SUB_CATEGORY='"+subCategory+"'");
	if(result==true)
	{
		%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:green'>Item successfully removed...!</h3>"/>
			</jsp:forward>
		<%
	}
	else
	{
		%>
			<jsp:forward page="<%= pageUrl %>">
				<jsp:param name="message" value="<h3 style='color:red'>Sorry !!! Category Doesn't exists.</h3>"/>
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