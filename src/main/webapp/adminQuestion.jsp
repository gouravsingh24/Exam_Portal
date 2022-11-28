<%@page import="com.wipro.model.QuestionDao"%>
<%@page import="com.wipro.bean.Question"%>
<%@page import="java.util.ArrayList"%>
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
<title>Manage Questions</title>

<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	
	<div class = "container">
	<center>
		<h3>
			<pre>
				<font color="blue" ><h1 style="background-color:powderblue;">LIST OF ALL QUESTION</h1></font>
			</pre>
		</h3>
	</center>
	<table class="table table-bordered table-hover">
		<tr tr class="table-dark">
			<th>Sr. no.</th>
			<th>Question</th>
			<th>Option A</th>
			<th>Option B</th>
			<th>Option C</th>
			<th>Option D</th>
			<th>Correct Answer</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<tr>
			<%
   int i = 0;
   ArrayList<Question> allQuestions = QuestionDao.getAllRecords();
  for(Question e : allQuestions)
  {   
	  
  
  %>
		
		<tr>
			<td><%=i++%></td>
			<td><%=e.getQuestion() %></td>
			<td><%=e.getA()%></td>
			<td><%=e.getB()%></td>
			<td><%=e.getC()%></td>
			<td><%=e.getD()%></td>
			<td><%=e.getAns()%></td>
			<td><a href="updatequestion.jsp?ques=<%=e.getQuestion()%>">Update</a></td>
			<td><a href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
		</tr>
		<%
  }
  %>
		<th colspan="4"><center>
				<input type="button" value="Back to Pannel"
					class="btn btn-outline-success"
					onclick="location.href='admin.jsp'">
			</center></th>
		

	</table>
</div>
</body>
</html>