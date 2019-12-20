<%@ page import="java.sql.*" %>
<%@ page import="myPackage.*" %>
<%@ page import="java.util.*" %>

<%
	int userId=Integer.parseInt(session.getAttribute("userId").toString());
	String itemName=request.getParameter("itemName");
	String size=request.getParameter("size");
	
	boolean res=table.perform("Update cart set SIZE='"+size+"' where USERID="+userId+" and ITEM_NAME='"+itemName+"'");
%>