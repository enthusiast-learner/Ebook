<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>

<%@include file="all-components/allcss.jsp"%>
</head>

<body style="background-color: #f7f7f7">
	<%@include file="all-components/navbar.jsp"%>

	<div class="container">
		<div class="row justify-content-center mt-2">
			<div class="col-md-6 card pb-2 ">
				<form>
					<h3 class="text-center mb-2 text-primary">Add Address</h3>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="address" class="form-label">Address</label> <input
								type="text" id=" address" class="form-control"
								placeholder="Enter address" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="landmark" class="form-label">Landmark</label> <input
								type="text" id="landmark" class="form-control"
								placeholder="Enter Landmark" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="city" class="form-label">City</label> <input
								type="text" id=" city" class="form-control"
								placeholder="Enter City" />
						</div>
						<div class="col-md-4 mb-3">
							<label for="state" class="form-label">State</label> <input
								type="text" id="state" class="form-control"
								placeholder="Enter State" />
						</div>
						<div class="col-md-4 mb-3">
							<label for="state" class="form-label">Zip</label> <input
								type="text" id="state" class="form-control"
								placeholder="Enter State" />
						</div>
					</div>
					<div class="justify-content-center d-flex">
					<button class="btn btn-warning ">Add Address</button>
					</div>

				</form>
			</div>

		</div>
	</div>
</body>
</html>