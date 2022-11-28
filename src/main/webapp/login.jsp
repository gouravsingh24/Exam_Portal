<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>


	<div class="container">

		<div class="row">

			<div class="col-md-6 offset-md-3">

				<div class="card mt-3">



					<div class="card-header bg-dark text-white text-center">

						<h3>Login Here</h3>

					</div>
					
					<%
					String msg = (String) session.getAttribute("message");
					if(msg!=null){
						
					
					%>
						
					<div class="alert alert-warning alert-dismissible fade show"
	role="alert">
	<strong><%=msg %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>	
						
						
					<%
					}
					session.removeAttribute("message");
					%>

					<div class="card-body">
						<form action = "LoginServlet" method = post>
							<div class="form-group">
								<label for="exampleInputEmail1">Username</label> <input
									type="text" name = "uname" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter username">


							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name = "pass" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<p>If not Registered <a href = "register.jsp">Click here</a></p>
							<div class="container text-center">
								<button type="submit" class="btn btn-dark border-0">Submit</button>
								<button type="reset" class="btn btn-dark border-0">Reset</button>
							</div>
						</form>

					</div>

			</div>



		</div>
	</div>

	</div>

</body>
</html>