<%@ page import="myPackage.*" %>
<%@ page import="java.sql.*" %>
<%
if(session.getAttribute("buy").toString()=="true")
{
int userId=Integer.parseInt(session.getAttribute("userId").toString());
String fullName=request.getParameter("fullName");
String mobile=request.getParameter("mobile");
String pincode=request.getParameter("pincode");
String fullAddress=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
int pid=Integer.parseInt(session.getAttribute("buyId").toString());

try
{
	boolean res=table.perform("Insert into address values("+userId+",'"+fullName+"','"+mobile+"','"+pincode+"','"+fullAddress+"','"+city+"','"+state+"')");
	if(res)
	{
		ResultSet rsValue=table.show("Select * from product where ID="+pid);
		rsValue.next();
		boolean resInsert=table.perform("Insert into orders values ("+userId+","+pid+",'"+rsValue.getString(2)+"','"+rsValue.getString(10)+"','M',"+rsValue.getInt(7)+","+rsValue.getInt(8)+",1,"+rsValue.getInt(7)+")");
		if(resInsert)
		{
			try{
				
				boolean resUpdate=table.perform("Update product set QUANTITY=QUANTITY -  1  where ID=" +  pid);
				if(resUpdate)
				{
					session.setAttribute("totalItems",0);
					%>
						<jsp:forward page="order.jsp"/>
					<%
				}
			}
			catch(Exception ex)
			{
				out.print(ex);
			}
		}
	}
	else
	{
		out.print("Sorry!!!Some error occured.");
	}
}
catch(Exception e)
{
	out.print(e);
}

}
else
{
int userId=Integer.parseInt(session.getAttribute("userId").toString());
String fullName=request.getParameter("fullName");
String mobile=request.getParameter("mobile");
String pincode=request.getParameter("pincode");
String fullAddress=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");

try
{
	boolean res=table.perform("Insert into address values("+userId+",'"+fullName+"','"+mobile+"','"+pincode+"','"+fullAddress+"','"+city+"','"+state+"')");
	if(res)
	{
		boolean resInsert=table.perform("Insert into orders select * from cart where USERID="+userId);
		if(res)
		{
			ResultSet rsUpdate=table.show("Select ITEM_ID,QUANTITY from cart where USERID="+userId);
			while(rsUpdate.next())
			{	
				try{
				
				boolean resUpdate=table.perform("Update product set QUANTITY=QUANTITY - " + rsUpdate.getInt(2) + " where ID=" +  rsUpdate.getInt(1));
				}
				catch(Exception ex)
				{
					out.print(ex);
				}
			}
			boolean resDel=table.perform("Delete from cart where USERID="+userId);
			if(resDel)
			{
				session.setAttribute("totalItems",0);
				%>
					<jsp:forward page="order.jsp"/>
				<%
			}
		}
	}
	else
	{
		out.print("Sorry!!!Some error occured.");
	}
}
catch(Exception e)
{
	out.print(e);
}
}
%>	