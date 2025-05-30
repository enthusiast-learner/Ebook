<%@page import="com.Entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 <html>
<head>

<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">

<title></title>
</head>
<body>


	<div class="container-fluid p-3" style="background-color: #bbdefb">
		<div class="row display-flex" style="align-items: center;">
			<div class="col-md-3 display-flex">

				<a class="navbar-brand" href="#"> <img src="img/book.png" alt=""
					width="50" height="35">
				</a>

			</div>
			<div class="col-md-3">

				<form class="d-flex" action="SearchPage.jsp" method="post">



					<input class="form-control me-2" type="search" placeholder="Search"
						name="ch" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>


			<div class="col-md-6">
				<c:if test="${not empty userinfo}">
					<div
						class="d-flex align-items-center justify-content-end gap-2 flex-wrap">

						<!-- Cart -->
						<a href="cart.jsp"
							class="btn btn-sm btn-warning d-flex align-items-center"> <i
							class="fa fa-shopping-cart me-1"></i>Cart
						</a>

						<!-- Username (with nowrap and ellipsis) -->
						<a class="btn btn-sm btn-primary d-flex align-items-center"
							href="#"
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
							<i class="fa fa-user me-1"></i> ${userinfo.name}
						</a>

						<!-- Logout -->
						<a class="btn btn-sm btn-danger d-flex align-items-center"
							href="<%=request.getContextPath()%>/Logoutservlet"> <i
							class="fa-solid fa-right-to-bracket me-1"></i>Logout
						</a>

					</div>
				</c:if>

				<c:if test="${empty userinfo}">
					<div class="d-flex align-items-center justify-content-end gap-2">
						<a class="btn btn-sm btn-primary d-flex align-items-center"
							href="loginpage.jsp"> <i
							class="fa-solid fa-right-to-bracket me-1"></i>Login
						</a> <a class="btn btn-sm btn-success d-flex align-items-center"
							href="registrationpage.jsp"> <i class="fa fa-user-plus me-1"
							aria-hidden="true"></i>Registration
						</a>
					</div>
				</c:if>
			</div>



		</div>

	</div>



	<%-- navbar-down --%>

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
						aria-current="page" href="index.jsp"><i
							class="fa-solid fa-house"></i>Home</a></li>
					<li class="nav-item active"><a class="nav-link active"
						href="allRecentBooks.jsp"><i class="fa-solid fa-book"></i>Recent
							Book</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="allNewBooks.jsp"><i class="fa-solid fa-book-open"></i>New
							Book</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="allOldBooks.jsp"><i class="fa-solid fa-book"></i>Old
							Book</a></li>
				</ul>

				<form class="d-flex">
						<div class="me-2">
						
						<a href="setting.jsp" class="btn btn-light btn-sm " type="submit"> <i
						class="fa-solid fa-gear"></i>Setting
					</a>
						</div>
					<div>
					<button class="btn btn-primary btn-sm" type="submit">
						<i class="fa-solid fa-phone"></i>Contact Us
					</button>
					</div>
					
				</form>
			</div>

		</div>
	</nav>
</body>
</html>