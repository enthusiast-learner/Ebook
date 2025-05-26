<%@page import="com.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Old Book</title>
<%@include file="all-components/allcss.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all-components/navbar.jsp"%>

	<div class="container justify-content-center">
		<div class="card mt-4">
			<div class="card-body d-flex justify-content-center align-items-center flex-column">


				<c:if test="${not empty succmsg }">
					<div class="text-center alert alert-success col-md-4 ">${succmsg}</div>
					<c:remove var="succmsg" scope="session" />
				</c:if>

				<c:if test="${not empty failmsg }">
					<p class="text-center text-danger">${failmsg }</p>
					<c:remove var="failmsg" scope="session" />
				</c:if>

				<table class="table table-striped">
					<thead class="bg-primary text-white">
						<tr>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Category</th>
							<th scope="col">Action</th>

						</tr>
					</thead>
					<%
					UserEntity us = (UserEntity) session.getAttribute("userinfo");
					String email = us.getEmail();
					BooksDAOImpl bd = new BooksDAOImpl(DBConnection.getCon());
					List<BookDetails> list = bd.getBookByOld(email, "Old Book");

					for (BookDetails b : list) {
					%>
					<tbody>
						<tr>
							<th scope="row"><%=b.getBookname()%></th>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getPrice()%></td>
							<td><%=b.getBookCategory()%></td>
							<td><a href="delUserOldBook?bid=<%=b.getBook_id()%>"
								class="btn btn-sm btn-danger">Delete</a></td>

						</tr>

					</tbody>
					<%
					}
					%>

				</table>
			</div>
		</div>
	</div>

</body>
</html>