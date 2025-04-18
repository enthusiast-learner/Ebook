<%@page import="com.Entity.UserEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="col-md-6">

				<form class="d-flex">

					

					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
			<div class="col-md-3">
			<%
					 UserEntity users = (UserEntity) session.getAttribute("userinfo");
					
			if(users!=null){%>
				<a class="btn btn-primary" href="loginpage.jsp"><i
					class="fa-solid fa-right-to-bracket"></i>Logout</a>
			<% 
			}
			
			else{%>
				<a class="btn btn-primary" href="loginpage.jsp"><i
					class="fa-solid fa-right-to-bracket"></i>Login</a>
				
			<% }%>
			
			
				 <a
					class="btn btn-success" href="registrationpage.jsp"><i
					class="fa fa-user-plus" aria-hidden="true"></i>Registration</a>
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
						href="allRecentBooks.jsp"><i class="fa-solid fa-book"></i>Recent Book</a></li>
					<li class="nav-item"><a class="nav-link active" href="allNewBooks.jsp"><i
							class="fa-solid fa-book-open"></i>New Book</a></li>
					<li class="nav-item"><a class="nav-link active" href="allOldBooks.jsp"><i
							class="fa-solid fa-book"></i>Old Book</a></li>
				</ul>

				<form class="d-flex">

					<button class="btn btn-success " type="submit">
						<i class="fa-solid fa-gear"></i>Setting
					</button>
					<button class="btn btn-primary" type="submit">
						<i class="fa-solid fa-phone"></i>Contact Us
					</button>
				</form>
			</div>

		</div>
	</nav>
</body>
</html>