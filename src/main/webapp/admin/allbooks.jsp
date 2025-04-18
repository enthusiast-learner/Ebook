<%@page import="com.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@include file="allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userinfo}">
		<c:redirect url="../loginpage.jsp"/>
	</c:if>
	<h4 class="text-center">Hello Admin!</h4>
	<c:if test="${not empty succmsg}">
		<p class="text-center text-success">${succmsg}</p>
		<c:remove var="succmsg" scope="session" />
	</c:if>

	<c:if test="${not empty failmsg}">
		<p class="text-center text-alert">${failmsg}</p>
		<c:remove var="failmsg" scope="session" />
	</c:if>
	
	
	<div class="container">
		<table class="table table-striped ">
			<thead class="bg-info text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Category</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BooksDAOImpl dao = new BooksDAOImpl(DBConnection.getCon());
				List<BookDetails> list = dao.getAllBook();
				for (BookDetails b : list) {
				%>
				<tr>
					<td><%=b.getBook_id()%></td>
					<td><img
						src="${pageContext.request.contextPath}/books/<%= b.getPhoto() %>"
						style="width: 100px; height: 100px;" alt="Book Image"></td>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>

					<td><a href="edit_books.jsp?id=<%=b.getBook_id()%>"
						class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i>Edit</a> <a href="<%=request.getContextPath()%>/delete?id=<%=b.getBook_id() %>"
						class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>
	<div style="margin-top: 210px">
		<%@include file="footer.jsp"%></div>

</body>
</html>