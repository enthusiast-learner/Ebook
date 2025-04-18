<%@page import="java.util.List"%>
<%@page import="database.DBConnection"%>
<%@page import="com.Entity.BookDetails"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Books</title>
<%@include file="all-components/allcss.jsp"%>
</head>
<body>
<%@include file="all-components/navbar.jsp"%>
<div class="container-fluid text-center">
		<h3>New Books</h3>
		<div class="row ">
			<%
			BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
		   List<BookDetails> list=	bdao.getAllNewBooks();

			for (BookDetails b : list) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card">
					<div class="card-body text-center">
					<img alt="book"
							  src="<%= request.getContextPath() + "/books/" + b.getPhoto() %>" 
							class="img-fluid mb-2"
							style="height: 200px; object-fit: contain;">
						<h5 class="card-title"><%=b.getBookname()%></h5>
						<p class="card-text mb-1"><%=b.getAuthor()%></p>
						<p class="card-text">
							Category:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2 flex-wrap">
							<a href="#" class="btn btn-sm btn-danger"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href="#"
								class="btn btn-sm btn-danger">View</a> <a href="#"
								class="btn btn-sm btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
			</div>
</body>
</html>