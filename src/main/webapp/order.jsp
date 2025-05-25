<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order page</title>

<%@include file="all-components/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all-components/navbar.jsp"%>
	<div class="container">
	<h3 class="text-center text-primary pb-3 pt-2">Your Order</h3>
	 <table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Name</th>
      <th scope="col">BookName</th>
      <th scope="col">Author</th>
       <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
       <td>400</td>
      <td>COD</td>
    </tr>
 
  </tbody>
</table>
	</div>
</body>
</html>