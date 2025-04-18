<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add books</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userinfo}">
		<c:redirect url="../loginpage.jsp"/>
	</c:if>
	<div class="container">
		<div class="row m-3">
			<div
				class="col-md-4 offset-md-4 shadow-none p-2 mb-5 bg-light rounded">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">
							<i class="fa-solid fa-plus p-3"></i>Add Books
						</h4>
						<!-- enctype => because we are sending photo with data
						(img)sending file as binary data 
						
						with this we can send file data to servlet-->
						<c:if test="${not empty succmsg}">
						<p class="text-center text-success">${succmsg}</p>
						<c:remove var="succmsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failmsg}">
						<p class="text-center text-success">${failmsg}</p>
						<c:remove var="failmsg" scope="session"/>
						</c:if>
						
						
						<form method="post" class="m-3" action="../addBookServlet" enctype="multipart/form-data">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Book
									Name <span style="color: red;">*</span>
								</label> <input type="text" class="form-control" name="Bookname"
									required>

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Author
									Name <span style="color: red;">*</span>
								</label> <input type="text" class="form-control" name="Authorname"
									required>

							</div>
							<!-- Price -->
							<div class="mb-3">
								<label class="form-label">Price<span style="color: red;">*</span></label>
								<input type="number" name="price" class="form-control" required>
							</div>

							<!-- Book Category -->
							<div class="mb-3">
								<label class="form-label">Book Categories</label> <select
									class="form-select" name="category" required>
									<option selected disabled>--select--</option>
									<option value="New Book">New Book</option>
									<option value="Old Book">Old Book</option>

								</select>
							</div>
							<!-- Book Status -->
							<div class="mb-3">
								<label class="form-label">Book Status</label> <select
									class="form-select" name="status" required>
									<option selected disabled>--select--</option>
									<option value="Available">Available</option>
									<option value="Out of Stock">Out of Stock</option>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Upload Photo</label> <input
									type="file" name="photo" class="form-control-file" name="bimg">
							</div>

							<!-- Submit Button -->
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Add Book</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:210px">
	<%@include file="footer.jsp" %></div>

</body>
</html>