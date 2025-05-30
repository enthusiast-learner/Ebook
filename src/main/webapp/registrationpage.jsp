<%@page import="java.sql.Ref"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%

%>


<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #fafafa">
	<%@include file="all-components/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">



			<div
				class="col-md-4  offset-md-4 shadow-none p-3 mb-5 bg-light rounded">

				<div class="card " style="">
					<div class="card-body">
						<h4 class="text-center">
							<i class="fa fa-user-plus" aria-hidden="true"></i>Registration
							Page
						</h4>

						<c:if test="${not empty regsuc}">
							<p class="text-center text-success">${regsuc}</p>
							<c:remove var="regsuc" scope="session" />
						</c:if>

						<c:if test="${not empty failmsg}">
							<p class="text-center text-danger">${failmsg}</p>
							<c:remove var="failmsg" scope="session" />
						</c:if>
							<c:if test="${not empty regfail}">
							<p class="text-center text-danger">${regfail}</p>
							<c:remove var="regfail" scope="session" />
						</c:if>


						<!-- when user submits the form the data sent to server using HTTP post method
						and doPost() in servlet -->
						<form method="post" class="m-3" action="RegisterServlet">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Full
									Name <span style="color: red;">*</span>
								</label> <input type="text" class="form-control" name="name" required>

							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address <span style="color: red;">*</span>
								</label> <input type="email" class="form-control" name="email"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="mb-3">
								<label for="" class="form-label">Mobile No <span
									style="color: red;">*</span></label> <input type="number"
									class="form-control" name="mobile">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password
									<span style="color: red;">*</span>
								</label> <input type="password" class="form-control" name="password"
									id="">
							</div>

							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and Condition</label>
							</div>


							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all-components/footer.jsp"%>
</body>
</html>