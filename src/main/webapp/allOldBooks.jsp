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
<title>Old Books</title>
<%@include file="all-components/allcss.jsp"%>
</head>
<body>
<%@include file="all-components/navbar.jsp"%>
<div class="container-fluid text-center">
		<h3>Old Books</h3>
		<div class="row ">
			<%
			BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
			   List<BookDetails> list3= bdao.getOldBooks();
			   
			   for(BookDetails b3 : list3){
			%>
			<div class="col-md-3 mb-4">
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
							 <a href="viewBook.jsp?bid=<%=b3.getBook_id()%>"
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
		
	</div>
</body>
</html>