<%@page import="com.wipro.bean.Login"%>

<%
Login lg = (Login) session.getAttribute("current_user");
String type = session.getAttribute("type").toString();

if (lg == null) {
	session.setAttribute("message", "You are not Logged in. Please Login first");
	response.sendRedirect("login.jsp");
	return;
}
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plans</title>

<%@include file="components/common_css_js.jsp"%>
<style>
.admin .card {
	border: 1px solid black !important;
}
</style>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin mt-5 py-5 ">
		<div class="row">

			<div class="col-md-4 ">
				<div class="card" data-toggle="modal" data-target="#add-free-modal">
					<div class="card-header bg-dark text-white text-center">
						<h1 text-center>Free</h1>
					</div>
					<div class="card-body">
						<h1>Rs.0</h1>
						<ul>
							<li>7 days Free Trial</li>
							<li>No E-mail Support</li>
							<li>1 Attempt only</li>
							<li>No Downloads</li>
						</ul>
					</div>

				</div>





			</div>


			<div class="col-md-4 ">
				<div class="card" data-toggle="modal" data-target="#add-basic-modal">
					<div class="card-header bg-dark text-white text-center">
						<h1>Basic</h1>
					</div>
					<div class="card-body">
						<h1 text-center>Rs.99</h1>
						<ul>
							<li>30 Days Access</li>
							<li>E-mail Support</li>
							<li>1 Attempt only</li>
							<li>No Downloads</li>
						</ul>
					</div>

				</div>


			</div>




			<div class="col-md-4 ">
				<div class="card" data-toggle="modal" data-target="#add-premium-modal">
					<div class="card-header bg-dark text-white text-center">
						<h1>Premium</h1>
					</div>
					<div class="card-body">
						<h1 text-center>Rs.149</h1>
						<ul>
							<li>3 Months Access</li>
							<li>E-mail Support</li>
							<li>Unlimited Attempts</li>
							<li>Download Access</li>
						</ul>
					</div>

				</div>


			</div>

		</div>


	</div>




<!-- Free Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-free-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Free Subscription</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="PlanServlet" method=post>

						<div class="form-group">
							<input type="text" class="form-control" name="plan"
								 value = "1" hidden>
									<div class="form-group">
							<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Options</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01" name = "select">
    <option selected>Choose...</option>
    <option value="State Bank Of India"  >State Bank Of India</option>
    <option value="HDFC Bank" >HDFC Bank</option>
    <option value="ICICI Bank" >ICICI Bank</option>
  </select>
</div>
<input type="text" class="form-control" name="account"
								 placeholder = "Account Number" required >
						</div>
								 
								 
						</div>

						<div class="container text-center">
							<input type = "submit" class="btn btn-outline-success">

						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End Free Madal -->
	
	
	
	<!-- Basic Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-basic-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Basic Subscription</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="PlanServlet" method=post>

						<div class="form-group">
							<input type="text" class="form-control" name="plan"
								 value = "2" hidden>
									<div class="form-group">
							<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Options</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01" name = "select">
    <option selected>Choose...</option>
    <option value="State Bank Of India"  >State Bank Of India</option>
    <option value="HDFC Bank" >HDFC Bank</option>
    <option value="ICICI Bank" >ICICI Bank</option>
  </select>
</div>
<input type="text" class="form-control" name="account"
								 placeholder = "Account Number" required >
						</div>
								 
								 
						</div>

						<div class="container text-center">
							<input type = "submit" class="btn btn-outline-success">

						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End Basic Madal -->
	
	
	<!-- Premium Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-premium-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Premium Subscription</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="PlanServlet" method=post>

						<div class="form-group">
							<input type="text" class="form-control" name="plan"
								 value = "3" hidden>
									<div class="form-group">
							<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Options</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01" name = "select">
    <option selected>Choose...</option>
    <option value="State Bank Of India"  >State Bank Of India</option>
    <option value="HDFC Bank" >HDFC Bank</option>
    <option value="ICICI Bank" >ICICI Bank</option>
  </select>
</div>
<input type="text" class="form-control" name="account"
								 placeholder = "Account Number" required >
						</div>
								 
								 
						</div>

						<div class="container text-center">
							<input type = "submit" class="btn btn-outline-success">

						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End Premium Madal -->
	
	


	
</body>
</html>