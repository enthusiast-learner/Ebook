
<%@page import="java.util.List"%>
<%@page import="database.DBConnection"%>
<%@page import="com.Entity.BookDetails"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Books</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="all-components/allcss.jsp"%>

<style>
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1000;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast {
  display: none;
}

#toast.display {
  display: block;
  visibility: visible;
  animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}
@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>

<body>
	<%
	HttpSession se = request.getSession(false);
	UserEntity us = null;

	if (se != null) {
		us = (UserEntity) session.getAttribute("userinfo");
	}
	%>

	<c:if test="${not empty addcart}">
		<div id="toast">${addcart}</div>

		<script type="text/javascript">
    function showToast() {
      $('#toast').addClass("display");
      setTimeout(() => {
        $('#toast').removeClass("display");
      }, 3000);
    }

    showToast();
  </script>
  
  <c:remove var="addcart" scope="session"/>
	</c:if>



	<%@include file="all-components/navbar.jsp"%>
	<div class="container-fluid text-center">
		<h3>New Books</h3>
		<div class="row ">
			<%
			BooksDAOImpl bdao = new BooksDAOImpl(DBConnection.getCon());
			List<BookDetails> list = bdao.getAllNewBooks();

			for (BookDetails b : list) {
			%>
			<div class="col-md-3 mb-4">
				<div class="card">
					<div class="card-body text-center">
						<img alt="book"
							src="<%=request.getContextPath() + "/books/" + b.getPhoto()%>"
							class="img-fluid mb-2"
							style="height: 200px; object-fit: contain;">
						<h5 class="card-title"><%=b.getBookname()%></h5>
						<p class="card-text mb-1"><%=b.getAuthor()%></p>
						<p class="card-text">
							Category:
							<%=b.getBookCategory()%></p>
						
						<div class="d-flex justify-content-center gap-2 flex-wrap">
						
							<%
							if (us == null) {
							%>
							<a href="loginpage.jsp" class="btn btn-sm btn-danger"> <i
								class="fa-solid fa-cart-shopping"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<!-- This is creating a URL that sends two query parameters to the servlet: bid and uid -->
							<!-- bid : which book add to the card
					   uid : which user adding the book to the cart
					 -->

							<a
								href="cartServlet?bid=<%=b.getBook_id()%>&uid=<%=us.getUid()%>"
								class="btn btn-sm btn-danger"> <i
								class="fa-solid fa-cart-shopping"></i> Add Cart
							</a>
							<%
							}
							%>
								
								
								<a href="viewBook.jsp?bid=<%=b.getBook_id()%>"
								class="btn btn-sm btn-danger">View</a> <a href="#"
								class="btn btn-sm btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>