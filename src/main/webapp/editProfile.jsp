<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all-components/navbar.jsp"%>
	<div class="container p-2 ">
		<%
		 UserEntity u=(UserEntity) session.getAttribute("userinfo");

		%>

		<div class="row">
			<div
				class="col-md-4  offset-md-4 shadow-none p-3 mb-5 bg-light rounded">
				<div class="card">
					<div class="card-body">
						<h3 class="text-primary text-center">Edit Profile</h3>
						<form>

							<div class="mb-3">
								<label for="name" class="form-label">Name*</label> <input
									type="text" id="name" class="form-control"
									placeholder="Enter full name" required="required" value="<%=u.getName() %>" />
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email*</label> <input
									type="text" id="author" class="form-control"
									placeholder="Enter Email" required="required" value="<%=u.getEmail() %>" />
							</div>
							<div class="mb-3">
								<label for="phoneno" class="form-label">Phone No*</label> <input
									type="number" id="phoneno" class="form-control" value="<%=u.getMobile() %>"
									required="required" />
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password*</label> <input
									type="password" id="password" class="form-control"
									required="required" />
							</div>


							<button class="btn btn-primary btn-sm">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>