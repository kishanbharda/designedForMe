<%
int bid=Integer.parseInt(request.getParameter("id"));
session.setAttribute("buy",true);
session.setAttribute("buyId",bid);
%>
<jsp:forward page="deliveryDetail.jsp"/>