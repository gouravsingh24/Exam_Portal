<%@page import="com.wipro.bean.Login"%>

<%
Login lg = (Login) session.getAttribute("current_user");
String type = session.getAttribute("type").toString();

if (lg == null) {
	session.setAttribute("message", "You are not Logged in. Please Login first");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (!type.equals("admin")) {
		session.setAttribute("message", "You are not Admin");
		response.sendRedirect("login.jsp");
		return;
	}

}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Pannel</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container admin">


		<div class="container-fluid">

			<%@include file="components/message.jsp"%>

		</div>




		<div class="row mt-5">



			<div class="col-md-4">



				<div class="card" data-toggle="modal" data-target="#add-user-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/man.png">
						</div>
						<h1 class="text-uppercase text-muted">Users</h1>

					</div>
				</div>

			</div>

			<div class="col-md-4">

				<div class="card" data-toggle="modal"
					data-target="#add-instructions-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/lightbulb.png">
						</div>


						<h1 class="text-uppercase text-muted">Instructions</h1>



					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card" data-toggle="modal"
					data-target="#add-question-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/sign-form.png">
						</div>
						<h1 class="text-uppercase text-muted">Questions</h1>
					</div>
				</div>
			</div>




		</div>

		<div class="row mt-5">


			<div class="col-md-6 offset-md-3">



				<div class="card" data-toggle="modal"
					data-target="#add-manage-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid" alt=""
								src="image/recovery.png">
						</div>
						<h1 class="text-uppercase text-muted">Manage</h1>

					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Instruction Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-instructions-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add
						Instructions</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="InstructionServlet" method=post>

						<div class="form-group">
							<textarea style="height: 200px;" class="form-control"
								name="instruction" placeholder="Enter Instruction" required></textarea>
						</div>

						<div class="container text-center">

							<button class="btn btn-outline-success">Add Instruction</button>

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

	<!-- End Instruction Madal -->



	<!-- User Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-user-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add User</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="UserServlet" method=post>

						<div class="form-group">
							<input type="text" class="form-control" name="uname"
								placeholder="Enter Username" required> <input
								type="email" class="form-control" name="email"
								placeholder="Enter Email" required> <input
								type="password" class="form-control" name="pwd"
								placeholder="Enter Password" required> <input
								type="number" class="form-control" name="phone"
								placeholder="Enter Phone No." required>
							<textarea style="height: 200px;" class="form-control"
								name="address" placeholder="Enter Address" required></textarea>



						</div>

						<div class="container text-center">

							<button class="btn btn-outline-success">Add User</button>

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

	<!-- End User Madal -->
	
	
	<!-- Question Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-question-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Question</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="QuestionServlet" method=post>

						<div class="form-group">
							<input type="text" class="form-control" name="question"
								placeholder="Enter Question" required>
								 
								 <input
								type="text" class="form-control" name="a"
								placeholder="Option A" required> <input
								type="text" class="form-control" name="b"
								placeholder="Option B" required> <input
								type="text" class="form-control" name="c"
								placeholder="Option C" required>
							<input type = "text" class = "form-control" name = "d" placeholder = "Option D" required>
							<input type = "text" class = "form-control" name = "ans" placeholder = "Answer" required>

						</div>

						<div class="container text-center">

							<button class="btn btn-outline-success">Add Question</button>

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

	<!-- End Question Madal -->
	
	
	<!-- Manage Modal -->



	<!-- Modal -->
	<div class="modal fade" id="add-manage-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add
						Instructions</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					.

					<form action="AdminManageServlet" method=post>

						<div class="form-group">
							<div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01">Options</label>
  </div>
  <select class="custom-select" id="inputGroupSelect01" name = "select">
    <option selected>Choose...</option>
    <option value="1"  >Manage Users</option>
    <option value="2" >Manage Instructions</option>
    <option value="3" >Manage Questions</option>
  </select>
</div>
						</div>

						<div class="container text-center">

							<button class="btn btn-outline-success">Confirm</button>

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

	<!-- End Manage Madal -->





</body>
</html>