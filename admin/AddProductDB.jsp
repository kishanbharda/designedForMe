<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>
 
<%
try
{
	String productName="";
	String mainCategory="";
	String subCategory="";
	String size="";
	String color="";
	int price=0;
	int discount=0;
	int quantity=0;
	String description="";
	
	String ImageFile="";	
	String itemName = "", nm="", addr="";
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	if (!isMultipart)
	{

	}
	else
	{
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try
		{
			items = upload.parseRequest(request);
		}
		catch (FileUploadException e)
		{
			e.getMessage();
		}
 
		Iterator itr = items.iterator();
		while (itr.hasNext())
		{
			FileItem item = (FileItem) itr.next();
			if (item.isFormField())
			{
				String name = item.getFieldName();
				String value = item.getString();

				if(name.equals("productName"))
				{	
					productName = value;
				}
	
				if(name.equals("mainCategory"))
				{
					mainCategory = value;
				}

				if(name.equals("subCategory"))
				{
					subCategory = value;
				}

				if(name.equals("size"))
				{
					size=value;
				}
				
				if(name.equals("color"))
				{
					color=value;
				}
				
				if(name.equals("price"))
				{
					price=Integer.parseInt(value);
				}
				
				if(name.equals("discount"))
				{
					discount=Integer.parseInt(value);
				}
				
				if(name.equals("quantity"))
				{
					quantity=Integer.parseInt(value);
				}
				
				if(name.equals("image"))
				{
					ImageFile=value;
				}
				
				if(name.equals("description"))
				{
					description=value;
				}
			}
			else
			{
				try
				{
					itemName = item.getName();
					File savedFile = new File(config.getServletContext().getRealPath("/") + "designedForMe\\images\\product\\" + itemName);
					item.write(savedFile);
				}
				catch (Exception e)
				{
					out.println("Error"+e.getMessage());
				}
			}
		}

		try
		{
			boolean result=table.perform("Insert into product (NAME,MAIN_CATEGORY,SUB_CATEGORY,SIZE,COLOR,PRICE,DISCOUNT,QUANTITY,IMAGE,DESCRIPTION) values ('"+productName+"','"+mainCategory+"','"+subCategory+"','"+size+"','"+color+"',"+price+","+discount+","+quantity+",'"+itemName+"','"+description+"')");
			if(result==true)
			{
				%>
					<jsp:forward page="AddProduct.jsp?message=<h3 style='color:green'>Product successfully inserted...!</h3>"/>
				<%
			}
			else
			{
				%>
					<jsp:forward page="AddProduct.jsp?message=<h3 style='color:red'>Product insertion failed...!</h3>"/>
				<%
			}
		}
		catch(Exception el)
		{
			out.println("Inserting error"+el.getMessage());
		 }
	}
}
catch (Exception e)
{
	out.println(e.getMessage());
}

%>