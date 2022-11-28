<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid ">


		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">

				<div class="card border-dark mb-3">

					<%@include file="components/message.jsp"%>

					<div class="card-body px-5">

						<div class="container text-center">
							<img class="img-fluid" style="max-width: 60px;" alt="err"
								src="image/sign-form.png">

						</div>

						<h3 class="text-center my-.3">Registration Form</h3>

						<form action="RegisterServlet" method=post>
							<div class="form-group">
								<label for="name">Username</label> <input name="uname"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="email">Email</label> <input name="email"
									type="email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input name="pwd"
									type="password" class="form-control" id="password"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="phone">Phone No.</label> <input name="phone"
									type="number" class="form-control" id="phone"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="address">Address</label>
								<textarea name="address" style="height: 120px"
									class="form-control" id=" address" aria-describedby="emailHelp"
									placeholder="Enter here"></textarea>
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>

						</form>

					</div>

				</div>

			</div>
		</div>



	</div>

</body>
</html>