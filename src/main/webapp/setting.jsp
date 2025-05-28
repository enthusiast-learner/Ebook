<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="all-components/style.css">
<meta charset="UTF-8">
<title>setting</title>
<%@include file="all-components/allcss.jsp"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<c:if test="${empty userinfo}">

		<c:redirect url="loginpage.jsp"></c:redirect>
	</c:if>


	<%@include file="all-components/navbar.jsp"%>

	<div class="container text-center">
		<h3>Hello!${userinfo.name }</h3>
		<div class="row mt-4">
			<div class="col-md-4">

				<a href="sellBook.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							<h3>Sell Old Book</h3>

						</div>
					</div>
				</a>



			</div>
			<div class="col-md-4">

				<a href="userOldBook.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							<h3>Old Book</h3>

						</div>
					</div>
				</a>



			</div>
			<div class="col-md-4">

				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa fa-address-card fa-3x text-primary"></i>
							<h3>Login & Security (Edit Profile)</h3>

						</div>
					</div>
				</a>

			</div>


		</div>
		<div class="row mt-4">
		
			<div class="col-md-6">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i>
							<h3>My Order</h3>
							<p>Track your Order</p>

						</div>
					</div>
				</a>

			</div>
			<div class="col-md-6">
				<a href="helpCenter.jsp">
					<div class="card">
						<div class="card-body">
							<i class="fa-solid fa-circle-user fa-3x text-primary"></i>
							<h3>Help Center</h3>
							<p>24*7 Service</p>

						</div>
					</div>
				</a>

			</div>

		</div>
	</div>

</body>
</html>