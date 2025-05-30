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
<link rel="stylesheet" href="style.css">
<title>Search Page</title>
<%@include file="all-components/allcss.jsp"%>
</head>
<body>
	
<%@include file="all-components/navbar.jsp"%>
	
	<div class="container-fluid text-center mt-2px">
		<h3>Recent Books</h3>
		<div class="row mt-2">
			<%
			
			String ch = request.getParameter("ch");
			BooksDAOImpl bd2 = new BooksDAOImpl(DBConnection.getCon());
			List<BookDetails> list2 = bd2.getBookBySearch(ch);

			for (BookDetails b2 : list2) {
			%>
			<div class="col-sm-3 mb-4">
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
								class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a href="viewBook.jsp?bid=<%=b2.getBook_id()%>"
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
		
		
	</div>
	
	

</body>
</html>