<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>
<%@ page import="java.util.*" %>

<%! int totalAmount=0; %>
<%! int totalItems=0; %>
<%
	int userId=Integer.parseInt(session.getAttribute("userId").toString());
	String itemName=request.getParameter("itemName");
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	int total=Integer.parseInt(request.getParameter("total"));
	boolean res=table.perform("Update cart set QUANTITY="+quantity+",TOTAL="+total+" where USERID="+userId+" and ITEM_NAME='"+itemName+"'");
	
	ResultSet rsTI=table.show("Select sum(QUANTITY) from cart where USERID="+userId);
	rsTI.next();
	totalItems=rsTI.getInt(1);
	
	ResultSet rsTA=table.show("Select sum(TOTAL) from cart where USERID="+userId);
	rsTA.next();
	totalAmount=rsTA.getInt(1);
%>
<%= 
	"<div class=col-md-6 style=background-color:#ccff99><h3><b>Total Items : </b>"+totalItems+"</h3></div><div class=col-md-6 style=background-color:#22ff99><h3><b>Total Amount : </b>"+totalAmount+"</h3></div>"
%>
