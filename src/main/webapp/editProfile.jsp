<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all-components/navbar.jsp"%>
	<c:if test="${empty userinfo}">
	<c:redirect url="../loginpage.jsp" />
	</c:if>
	<div class="container p-2 ">
		<%
		 UserEntity u=(UserEntity) session.getAttribute("userinfo");
				
		%>
		
		<div class="row">
			<div
				class="col-md-4  offset-md-4 shadow-none p-3 mb-5 bg-light rounded">
				<div class="card">
				<c:if test="${not empty succmsg }">
					<div class="text-white d-flex justify-content-center bg-primary">${succmsg}</div>
					<c:remove var="succmsg" scope="session"/>
					</c:if>
					<c:if test="${not empty failmsg }">
					<div class="text-white d-flex justify-content-center bg-warning">${failmsg}</div>
					<c:remove var="failmsg" scope="session"/>
					</c:if>
					<div class="card-body">
					
						<h3 class="text-primary text-center">Edit Profile</h3>
						<form method="post" action="updateUserinfo" enctype="multipart/form-data">
						
						<input type="hidden" value="<%=u.getUid() %>" name="uid">

							<div class="mb-3">
								<label for="name" class="form-label">Name*</label> <input
									type="text" id="name" class="form-control" name="name"
									placeholder="Enter full name" required="required" value="<%=u.getName() %>" />
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email*</label> <input
									type="text" id="author" class="form-control" name="email"
									placeholder="Enter Email" required="required" value="<%=u.getEmail() %>" />
							</div>
							<div class="mb-3">
								<label for="phoneno" class="form-label">Phone No*</label> <input
									type="number" id="phoneno" class="form-control" name="mobile" value="<%=u.getMobile() %>"
									required="required" />
							</div>

							<div class="mb-3">
								<label for="password" class="form-label" >Password*</label> <input
									type="password" id="password" class="form-control" name="password"
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