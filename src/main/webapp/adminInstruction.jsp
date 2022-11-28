<%@page import="com.wipro.bean.Login"%>
<%@page import="com.wipro.bean.Instructions"%>
<%@page import="com.wipro.model.InstructionsDao"%>
<%@page import="com.wipro.bean.AdminUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.model.AdminUserDao"%>
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
<title>Manage Instructions</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

<div class = "container">

	<center>
		<h3>
			<pre>
				<font color="blue" ><h1 style="background-color:powderblue;">LIST OF ALL INSTRUCTION</h1></font>
			</pre>
		</h3>
	</center>
	<table class="table table-bordered table-hover">
		<tr tr class="table-dark">
			<th>sl no.</th>
			<th>Instruction</th>
			<th>Operation</th>
			<th>delete</th>
		</tr>
		<tr>
		<tr>
			<%
   int i = 0;
   ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
  for(Instructions e : allinsts)
  {   
	  
  
  %>
		
		<tr>
			<td><%=i++%></td>
			<td><%=e.getInstruction()%></td>

			<td><a href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Update</a></td>
			<td><a href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>

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
			<th colspan="2"><input type="hidden"></th>
			
		</tr>
	</table>

</div>



</body>
</html>