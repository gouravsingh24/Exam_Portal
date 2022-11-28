<%@page import="com.wipro.model.InstructionsDao"%>
<%@page import="com.wipro.bean.Instructions"%>
<%@page import="com.wipro.bean.AdminUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.model.AdminUserDao"%>
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
<title>Admin Manage</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<center>
		<h3>
			<pre>
				<font color="blue">List of all Students</font>
			</pre>
		</h3>
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
  {  if(request.getParameter("username").equals(e.getName())) 
	{
      %>
		
		<tr class="table-primary">
			<form action="updatestudentnow.jsp">
				<input type="hidden" value="<%=e.getName()%>" type="text"
					name="usernameoriginal">
				<td><%=i++%></td>
				<td><input type="text" value="<%=e.getName()%>"
					name="uname"></input></td>
				<td><input type="text" value=<%=e.getEmail() %> name="email"></input>
				</td>
				<td><input type="text" value=<%=e.getPassword() %> name="pass"></input>
				</td>
				<td><input type="text" value=<%=e.getPhone() %> name="phone"></input>
				</td>
				<td><input type="text" value=<%=e.getAddress() %> name="address"></input>
				</td>
				<td><input type="text" value=<%=e.getUserType() %> name="type"></input>
				</td>
				
				
				
				<td><input type="submit" value="update"></td>
				<td><a href="deletestudent.jsp?username=<%=e.getName()%>">Delete</a></td>
			</form>
		</tr>
		<%	
	}
	else
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
  }
    %>
	
	</table>
	
	
	


</body>
</html>