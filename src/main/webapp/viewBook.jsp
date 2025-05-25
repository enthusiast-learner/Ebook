<%@page import="com.Entity.BookDetails"%>
<%@page import="database.DBConnection"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book detail</title>
<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all-components/navbar.jsp"%>
	<%
	HttpSession se = request.getSession(false);
	UserEntity us = null;

	if (se != null) {
		us = (UserEntity) session.getAttribute("userinfo");
	}
	%>
	
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
	BookDetails b = bdao.getbookbyId(bid);
	%>

	<div class="container p-3">
		<div class="row ">

			<div class="col-md-6  text-center p-5 border bg-white ">
				<img alt="img"
					src="<%=request.getContextPath() + "/books/" + b.getPhoto()%>"
					style="height: 150px; width: 150px"><br>
				<h4 class="mt-3">
					Book Name : <span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name : <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category : <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6  text-center p-5 border bg-white ">
				<h2><%=b.getBookname()%></h2>

				<%
				if ("Old Book".equals(b.getBookCategory())) {
				%>
				<h5>Contact to Seller</h5>
				<h5>
					<i class="fa-solid fa-envelope"></i>Email :
					<%=b.getEmail()%></h5>
				<%
				}
				%>


				<div class="row d-flex">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash on delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>



				</div>
				
				<div class=" text-center p-3">
				<%
					if("Old Book".equals(b.getBookCategory())){%>
						<a href="" class="btn btn-success"> <i
						class="fa-solid fa-cart-plus"></i>Continue shopping
					</a> 
					<%}else{%>
						<a href="cartServlet?bid=<%=b.getBook_id()%>&uid=<%=us.getUid()%>"class="btn btn-primary"> <i
						class="fa-solid fa-cart-plus"></i>Add Cart
					</a> 
					<%}
				%>
					<a href="" class="btn btn-danger"><i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>

				</div>
			</div>


		</div>
	</div>
</body>
</html>