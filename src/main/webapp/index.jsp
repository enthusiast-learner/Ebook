
<%@page import="com.Entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="all-components/style.css">

<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>Index page</title>
<%@include file="all-components/allcss.jsp"%>
</head>
<style>
.back-img {
	background: url("img/bookback.jpg");
	background-repeat: no-repeat;
	height: 50vh;
	width: 100%;
	background-size: cover;
}
</style>
<body>
	<%--navbar --%>
	<%@include file="all-components/navbar.jsp"%> --%>

	<%--background img --%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white p-5">
			<i class="fa-solid fa-book-open"></i>E-Book Management System
		</h2>
	</div>

	<%--card on homepage --%>
	<!-- start: recent books -->
	<div class="container-fluid text-center">
		<h3>Recent Books</h3>
		<div class="row">
			<%
			BooksDAOImpl bd2 = new BooksDAOImpl(DBConnection.getCon());
			List<BookDetails> list2 = bd2.getRecentBooks();

			for (BookDetails b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="book"
							  src="<%= request.getContextPath() + "/books/" + b2.getPhoto() %>" 
							class="img-fluid mb-2"
							style="height: 200px; object-fit: contain;"> 
						<h5 class="card-title"><%=b2.getBookname()%></h5>
						<p class="card-text mb-1"><%=b2.getAuthor()%></p>
						<%
						if (b2.getBookCategory().equals("Old Book")) {
						%>
						<div class="row d-flex">
							<div class=" justify-content-center gap-2 flex-wrap">
								<p class="card-text">
									Category:
									<%=b2.getBookCategory()%></p>
								<a href="#" class="btn btn-sm btn-danger">View</a> <a href="#"
									class="btn btn-sm btn-danger"><i
									class="fa-solid fa-indian-rupee-sign"></i><%=b2.getPrice()%></a>
							</div>
						</div>

						<%
						} else {
						%>
						<p class="card-text">
							Category:
							<%=b2.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2 flex-wrap">
							<a href="#" class="btn btn-sm btn-danger"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href="#"
								class="btn btn-sm btn-danger">View</a> <a href="#"
								class="btn btn-sm btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b2.getPrice()%></a>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div>
			<a href="allRecentBooks.jsp" class="btn  btn-lg btn-danger m-3 text-white"> View
				All</a>
		</div>
	</div>


	<!-- end : recentbooks -->

	<hr>
	<%--start - New book --%>
	<div class="container-fluid text-center">
		<h3>New Books</h3>
		<div class="row ">
			<%
			BooksDAOImpl bd = new BooksDAOImpl(DBConnection.getCon());
			List<BookDetails> list = bd.getNewBooks();

			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
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
		<div>
			<a href="" class="btn  btn-lg btn-danger m-3 text-white"> View
				All</a>
		</div>
	</div>


	<div class="container-fluid text-center">
		<h3>Old Books</h3>
		<div class="row ">
			<%
			BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
			   List<BookDetails> list3= bdao.getOldBooks();
			   
			   for(BookDetails b3 : list3){
			%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<img alt="book"
						  src="<%= request.getContextPath() + "/books/" + b3.getPhoto() %>" 
							class="img-fluid mb-2"
							style="height: 200px; object-fit: contain;"> 
						<h5 class="card-title"><%=b3.getBookname()%></h5>
						<p class="card-text mb-1"><%=b3.getAuthor()%></p>
						<p class="card-text">
							Category:
							<%=b3.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2 flex-wrap">
							 <a href="#"
								class="btn btn-sm btn-danger">View</a> <a href="#"
								class="btn btn-sm btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b3.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div>
			<a href="" class="btn  btn-lg btn-danger m-3 text-white"> View
				All</a>
		</div>
	</div>


	<%@include file="all-components/footer.jsp"%>
</body>
</html>