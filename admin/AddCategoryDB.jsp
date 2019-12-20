<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>


<%
String mainCategory=request.getParameter("mainCategory");
String subCategory=request.getParameter("subCategory");

try
{
	ResultSet rs=table.show("Select SUB_CATEGORY from category where SUB_CATEGORY='"+subCategory+"'");
	if(rs.next()){
		%>
		<jsp:forward page="AddCategory.jsp?message=<h3 style='color:red'>Category Allready exists...!</h3>"/>
		<%
	}
	else{
		boolean result=table.perform("Insert into category (MAIN_CATEGORY,SUB_CATEGORY) values ('"+mainCategory+"','"+subCategory+"')");
		
		if(result==true)
		{
		
			%>
			<jsp:forward page="AddCategory.jsp?message=<h3 style='color:green'>Category successfully inserted...!</h3>"/>
			<%	
		}
		else
		{
			%>
			<jsp:forward page="AddCategory.jsp?message=<h3 style='color:red'>Category successfully insertion is failed...!</h3>"/>
			<%
		}
	}
}
catch(Exception e)
{
	%>
			<jsp:forward page="RemoveCategory.jsp?message=<h3 style='color:red'><%= e %></h3>" />
	<%
}


%>