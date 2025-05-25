<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Book</title>
<link rel="stylesheet" href="all-components/style.css">
<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all-components/navbar.jsp"%>
	
	<div class="container justify-content-center">
	<div class="card mt-4 ">
	<div class="card-body">
	<table class="table table-striped">
		<thead class="bg-primary text-white ">
			<tr>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Mark</td>
				<td>Otto</td>
				<td><button class="btn btn-sm btn-danger">Delete</button></td>
			</tr>

		</tbody>
	</table>
	</div>
	</div>
</div>
</body>
</html>