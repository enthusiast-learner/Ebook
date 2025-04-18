<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="allcss.jsp"%>
<style type="text/css">

a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	text-decoration: none;
}

.card:hover {
	background-color: #f0f0f0;
	transition: background-color 0.3s ease;
	cursor: pointer;
}

.card-body i, .card-body h4 {
	transition: color 0.3s ease;
}

.card:hover .card-body i, .card:hover .card-body h4 {
	color: #007bff; /* Bootstrap primary */
}
   
   
</style>

</head>
<body>
<div class="main-wrapper">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userinfo}">
		<c:redirect url="../loginpage.jsp"/>
	</c:if>
	<div class="container">
		<div class="row p-5 ">

			<div class="col-md-3">
				<a href="addbooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-info"></i>
							<h4>Add Books</h4>
							----------
						</div>
					</div>
				</a>
			</div>


			<div class="col-md-3">
				<a href="allbooks.jsp">
					<div class="card">
						<div class="card-body text-center text-danger">
							<i class="fa-solid fa-book-open fa-3x"></i>
							<h4>All Books</h4>
							----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i>
							<h4>Orders</h4>
							----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<i class="fa-solid fa-right-to-bracket fa-3x text-muted"></i><br>
						<h4><a data-toggle="modal"
						data-target="#exampleModal">Logout</a></h4>
						----------
					</div>
				</div>
			</div>

		</div>

	</div>
	</div>
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
	
    <div style="margin-top:210px">
	<%@include file="footer.jsp" %></div>
</body>
</html>