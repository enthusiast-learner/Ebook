<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>

<%@include file="all-components/allcss.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body style="background-color: #f7f7f7">
<c:if test="${empty userinfo }">
	<c:redirect url="loginpage.jsp"></c:redirect>
</c:if>
	<%@include file="all-components/navbar.jsp"%>
	<div class="container p-2 ">


		<div class="row">
			<div
				class="col-md-4  offset-md-4 shadow-none p-3 mb-5 bg-light rounded">
				<div class="card">
					<div class="card-body">
					<c:if test="${not empty succmsg}">
						<p class="text-center text-success">${succmsg}</p>
						<c:remove var="succmsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failmsg}">
						<p class="text-center text-success">${failmsg}</p>
						<c:remove var="failmsg" scope="session"/>
						</c:if>
						<h3 class="text-primary text-center">Sell Book</h3>
						<!-- <form action="addOldBook" method="post" enctype="multipart/form-data"> -->
						<form action="addOldBook" method="post"
							enctype="multipart/form-data">


							<input type=hidden value="${userinfo.email }" name="user">

							<div class="mb-3">
								<label for="name" class="form-label">Book Name*</label> <input
									type="text" id="name" class="form-control" name="Bookname"
									placeholder="Enter full name" required="required" />
							</div>

							<div class="mb-3">
								<label for="author" class="form-label">Author Name*</label> <input
									type="text" id="author" class="form-control" name="Authorname"
									placeholder="Enter author name" required="required" />
							</div>

							<div class="mb-3">
								<label class="form-label">Price<span style="color: red;">*</span></label>
								<input type="number" name="price" class="form-control" required>

							</div>
							<div class="mb-3">
								<label class="form-label">Upload Photo</label> <input
									type="file" class="form-control-file" name="photo">
							</div>
							<button class="btn btn-primary btn-sm">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>