<%@page import="com.Entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<!-- jQuery (must be before Bootstrap JS) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Popper.js (for dropdowns, tooltips, and modals) -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">

<title></title>

</head>
<body>


	<div class="container-fluid p-3" style="background-color: #bbdefb">
		<div class="row display-flex" style="align-items: center;">
			<div class="col-md-3 display-flex">

				<a class="navbar-brand" href="#"> <img src="img/book.png"
					alt="book" width="50" height="35">
				</a>

			</div>
			<div class="col-md-6">

				<form class="d-flex">



					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>


			<div class="col-md-3">

				<c:if test="${not empty userinfo}">
					<a class="btn btn-primary" href="loginpage.jsp"><i
						class="fa-solid fa-user"></i>${userinfo.name}</a>
					<a class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal"><i
						class="fa-solid fa-right-from-bracket"></i>Logout</a>

				</c:if>

				<c:if test="${empty userinfo}">
					<a class="btn btn-primary" href="loginpage.jsp"><i
						class="fa-solid fa-right-to-bracket"></i>Login</a>
					<a class="btn btn-success" href="registrationpage.jsp"><i
						class="fa fa-user-plus" aria-hidden="true"></i>Registration</a>
				</c:if>









			</div>
		</div>



	</div>

	<!--start: Logout modal  -->



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="text-center">
				<h4>Do you want logout?</h4>

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					
						<a  href="../Logoutservlet" type="button" class="btn btn-primary">Logout</a>
					</div>
					

				</div>

			</div>
		</div>
	</div>

	<!--end : Logout modal -->


	<!-- navbar :down -->

	<nav class="navbar navbar-expand-lg "
		style="background-color: #80cbc4;">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp"><i
							class="fa-solid fa-house"></i>Home</a></li>

				</ul>


			</div>

		</div>
	</nav>
</body>
</html>