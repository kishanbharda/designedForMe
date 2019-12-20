<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>

<%

ResultSet rs=table.show("Select SUB_CATEGORY from category where MAIN_CATEGORY like '%".$_GET['id']."%'";);
String subCat[];
while(rs.next())
{
	subCat[];
}

%>

	