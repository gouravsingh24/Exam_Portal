<%@page import="com.wipro.bean.Instructions"%>
<%@page import="com.wipro.model.InstructionsDao"%>
<%@page import="com.wipro.bean.AdminUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.model.AdminUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>



<div class = "container">
	<center>
		<h3>
			<pre>
				<font color="blue" ><h1 style="background-color:powderblue;">LIST OF ALL STUDENT</h1></font>
		
		</h3>
		</pre>
	</center>
	<table class="table table-bordered table-hover">
		<tr tr class="table-dark">
			<th>Sr. no.</th>
			<th>Username</th>
			<th>Email</th>
			<th>Password</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Type</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<tr>
			<%
   int i = 0;
   ArrayList<AdminUser> allstudents = AdminUserDao.selectAllUsers();
  for(AdminUser e : allstudents)
  {   
	  
  
  %>
		
		<tr>
			<td><%=i++%></td>
			<td><%=e.getName() %></td>
			<td><%=e.getEmail()%></td>
			<td><%=e.getPassword() %></td>
			<td><%=e.getPhone() %></td>
			<td><%=e.getAddress() %></td>
			<td><%=e.getUserType() %></td>
			<td><a href="updatestudent.jsp?username=<%=e.getName()%>">Update</a></td>
			<td><a href="deletestudent.jsp?username=<%=e.getName()%>">Delete</a></td>
		</tr>
		<%
  }
  %>
  
  <tr>
			<th colspan="1" rowspan="2"><center>
					<input type="button" class="btn btn-outline-success"
						value="Back to Pannel"
						onclick="location.href='admin.jsp'">
				</center></th>
			
		</tr>
  
	</table>
	</div>
	
	
	


	
	
</body>
</html>