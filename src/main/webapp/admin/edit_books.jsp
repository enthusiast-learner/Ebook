<%@page import="com.Entity.BookDetails"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="com.DAO.BooksDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Edit Book</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userinfo}">
	<c:redirect url="../loginpage.jsp" />
	</c:if>
	<div class="container">
		<div class="row m-3">
			<div
				class="col-md-4 offset-md-4 shadow-none p-2 mb-5 bg-light rounded">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">
							<i class="fa-solid fa-plus p-3"></i>Update Books
						</h4>
						<!-- enctype => because we are sending photo with data
						(img)sending file as binary data 
						
						with this we can send file data to servlet-->




						<%
						int id = Integer.parseInt(request.getParameter("id"));

						BooksDAOImpl bd = new BooksDAOImpl(DBConnection.getCon());

						BookDetails b = bd.getbookbyId(id);
						%>

						<form method="post" class="m-3" action="<%=request.getContextPath()%>/editBookServlet"
							enctype="multipart/form-data">

							<input type="hidden" name="id" value="<%=b.getBook_id() %>" />


							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book
									Name <span style="color: red;">*</span>
								</label> <input type="text" class="form-control" name="Bookname"
									value="<%=b.getBookname()%>" required>

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author
									Name <span style="color: red;">*</span>
								</label> <input type="text" class="form-control" name="Authorname"
									value="<%=b.getAuthor()%>" required>

							</div>
							<!-- Price -->
							<div class="mb-3">
								<label class="form-label">Price<span style="color: red;">*</span></label>
								<input type="number" name="price" class="form-control"
									value="<%=b.getPrice()%>" required>
							</div>

							<!-- Book Status -->
							<div class="mb-3">
								<label class="form-label">Book Status</label> <select
									class="form-select" name="status" value="<%=b.getStatus()%>"
									required>
									<%
									if ("Available".equals(b.getStatus())) {
									%>
									<option value="Available">Available</option>
									<option value="Out of Stock">Out of Stock</option>
									<%
									} else {
									%>
									<option value="Out of Stock">Out of Stock</option>
									<option value="Available">Available</option>
									<%
									}
									%>






								</select>
							</div>


							<!-- Submit Button -->
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Update
									Book</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 210px">
		<%@include file="footer.jsp"%></div>

</body>
</html>