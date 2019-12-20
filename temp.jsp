<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>
<%@ page import="java.util.*" %>

<%
int id=Integer.parseInt(request.getParameter("id"));

int userId=Integer.parseInt(session.getAttribute("userId").toString());

try
{
	ResultSet rs=table.show("Select * from product where ID="+id);
	rs.next();

	int total=(rs.getInt(7)-rs.getInt(8));
	boolean res=table.perform("Insert into cart values ("+userId+","+id+",'"+rs.getString(2)+"','"+rs.getString(10)+"','M',"+rs.getInt(7)+","+rs.getInt(8)+",1,"+total+")");
	
	if(res==true)
	{
		out.print("Success");
	}
	else
	{
		out.print("Faild");
	}
	
}
catch(Exception e)
{
	out.print(e);
}
%>