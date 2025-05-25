<%@page import="java.util.List"%>
<%@page import="com.Entity.CartDetails"%>
<%@page import="com.DAO.CartDaoImpl"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart page</title>

<%@include file="all-components/allcss.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body style="background-color: #f0f1f2">
	<%@include file="all-components/navbar.jsp"%>

	<c:if test="${empty userinfo}">
		<c:redirect url="loginpage.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succmsg}">
		<div class="alert alert-success" id="successMsg" role="alert">${succmsg}</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>
	<c:if test="${not empty failmsg}">
		<div class="alert alert-danger" id="failMsg" role="alert">${failsg}</div>
		<c:remove var="failmsg" scope="session" />
	</c:if>
	
	<!-- JavaScript to auto-hide messages after 5 seconds -->
<script>
    setTimeout(function () {
        $("#successMsg").fadeOut("slow");
        $("#failMsg").fadeOut("slow");
    }, 2000);
</script>



	<div class="container">

		<div class="row justify-content-center mt-2">

			<!-- Left Column -->
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h2 class="text-center text-success">Your Selected Item</h2>
						<table class="table table-striped">
							<thead>
								<tr>

									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>

								</tr>
							</thead>

							<tbody>
								<%
								UserEntity u = (UserEntity) session.getAttribute("userinfo");
								//out.println("UserInfo: " + u);
								CartDaoImpl cd = new CartDaoImpl(DBConnection.getCon());
								List<CartDetails> cartd = cd.getBookByUser(u.getUid());
								//out.println("<h4>Cart size: " + cartd.size() + "</h4>");
								Double totalPrice = 0.0;
								for (CartDetails c : cartd) {
									totalPrice += c.getPrice();
								%>

								<tr>
									<td><%=c.getBookname()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book_servlet?cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Right Column -->
			<div class="col-md-6 card pb-2">
				<form>
					<h2 class="text-center text-success">Your Details for Order</h2>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name" class="form-label">Name</label> <input
								type="text id=" name"   class="form-control" readonly="readonly"
								placeholder="Enter full Name" value="<%=u.getName() %>" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="text" id=" email" class="form-control" readonly="readonly"
								placeholder="Enter email" value="<%=u.getEmail() %>" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="mobile" class="form-label">Mobile No</label> <input
								type="number" id="mobile" class="form-control" value="<%=u.getMobile() %>" placeholder="" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="address" class="form-label">Address</label> <input
								type="text" id=" address" class="form-control"
								placeholder="Enter address" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="landmark" class="form-label">Landmark</label> <input
								type="text" id="landmark" class="form-control"
								placeholder="Enter Landmark" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="city" class="form-label">City</label> <input
								type="text" id="city" class="form-control"
								placeholder="Enter City" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="state" class="form-label">State</label> <input
								type="text" id="state" class="form-control"
								placeholder="Enter State" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="zip" class="form-label">Zip</label> <input
								type="text" id="city" class="form-control" placeholder="" />
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label>Payment type</label> <select class="form-control">
								<option>select--</option>
								<option>Cash On Delivery</option>
							</select>

						</div>
						<div class="row mt-2 text-center">

							<div>
								<button class="btn btn-warning">Order Now</button>
								<button class="btn btn-success">Continue Shopping</button>
							</div>
				</form>
			</div>

		</div>
	</div>

</body>
</html>