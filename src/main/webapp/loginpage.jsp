<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>

<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #fafafa">
	<%@include file="all-components/navbar.jsp"%>
	<div class="container p-2">
		<div class="row justify-content-center m-5">
			<div class="col-md-5  ">

				<div class="card " style="">
					<div class="card-body">
						<h4 class="text-center">
							<i class="fa-solid fa-right-to-bracket"></i>Login Page
						</h4>
						<!-- "${not empty regsuc}" -->
					
						
						
						
						<c:if test="${not empty logfail }">
						<h5 class="text-danger text-center">${logfail}</h5>
						<c:remove var="logfail" scope="session"/>
						</c:if>
						
						<c:if test="${not empty logoutmsg}">
						 <h5 class="text-primary text-center">${logoutmsg}</h5>
						 <c:remove var="logoutmsg" scope="session"/>
						</c:if>
						
						
						<form action="LoginServlet" method="post" class="m-3">

							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp">


								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" class="form-control" name="password"
										id="">
								</div>
								<div class="d-flex justify-content-center">
									<button type="submit" class="btn btn-primary">Submit</button>

								</div>
								<div class="d-flex justify-content-center">
									<a href="registrationpage.jsp"> Create Account</a>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>