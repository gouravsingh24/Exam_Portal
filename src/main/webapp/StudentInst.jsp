<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.bean.Login"%>
<%@page import="com.wipro.bean.*" %>
<%@page import="com.wipro.model.*" %>

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
<title>Instructions</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>





	<%
	Login lg12 = (Login)session.getAttribute("current_user");
   String name = lg12.getName();
%>
	<div height="100px" width=100% style="background-color: #4BE7B0">
		<marquee behavior="alternate">
			<h2>
				<font color="green">Welcome <%out.println(name); %></font>
			</h2>
		</marquee>
	</div>
	<center>
		<pre>
<table class="table table-hover">
<tr>
 
 <th colspan="2"><center>
							<h4>
								<font color="red"><h1 ><center>Instructions</center></font>
							</h4>
						</center></th>
</tr>
<tr>

				
				<tr>
<%
   int i = 1;
   ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
  for(Instructions e : allinsts)
  {   
  %>
   
				
				<tr>
  <td><%=i++%></td>
  <td><%=e.getInstruction()%></td>
  </tr>
  <%
  }
  %>
<tr>

			
			</table>
<pre>
   <button
					type="button" class="btn btn-outline-primary btn-lg"
					onclick="location.href='Exam.jsp'">Start Test</button>
</pre>

	
	</center>




</body>
</html>