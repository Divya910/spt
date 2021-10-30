<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table{
	margin-left: auto;
	margin-right: auto;
}
ul{
list-style-type: none;
margin: 0;
padding: 0;
overflow:hidden;
background-color: #333;
}

li{
float: left;
}

li a{
display: block;
color: white;
text-align: center;
padding: 14px 16px;
text-decoration: none;
}
li a:hover {
	background-color: #111;
}

</style>
</head>
<body>
<%@page import="java.sql.*,calldatabase.*" %>
<table class="center">
<tr>
<td>
<ul>
<li><a class="active" href="adminhome.html">Home</a></li>
<li><a href="create.html">Add Space</a></li>
<li><a href="update.html">Update Space</a></li>
<li><a href="delete.html">Delete Space</a></li>
<li><a href="showspace.jsp">Space Status</a></li>
<li><a href="customer.jsp">Customer</a></li>
<li><a href="adminlogin.html">Logout</a></li>
</ul>
</td>
</tr>
</table>
<table style="border: solid;background-color: lime">
<tr><th colspan="5"> Details</th></tr>
<tr><td>ID</td><td>Name</td><td>email</td><td>Phone</td></tr>
<%
try{
	session=request.getSession(false);
	String cid=(String)session.getAttribute("cid");
	Connection cn=GetData.getCn();
	PreparedStatement ps=cn.prepareStatement("select cid,cname,cmail,cphn from customer");
	
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
</tr>
<%} %>
<%}catch(Exception e){
	out.print(e);
} %>
</table>
</body>
</html>