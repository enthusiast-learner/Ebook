<%@page import="com.Entity.BookOrderDetails"%>
<%@page import="java.util.List"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Orders</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userinfo}">
		<c:redirect url="../loginpage.jsp" />
	</c:if>
	<h4 class="text-center">Hello Admin!</h4>
	<div class="container">
		<table class="table table-striped">
			<thead class="bg-info text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookOrderImpl bo = new BookOrderImpl(DBConnection.getCon());
			    List<BookOrderDetails> bod =	bo.getAllOrderedBookAdmin();
			    
			    for(BookOrderDetails b : bod){%>
			    	<tr>
					<th scope="row"><%=b.getOrder_id() %></th>
					<td><%=b.getBookName() %></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFullAddress() %></td>
					<td><%=b.getMobile() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
					</tr>
			   <%}
				%>

				
			</tbody>
		</table>
	</div>
	<div style="margin-top: 210px">
		<%@include file="footer.jsp"%></div>

</body>
</html>