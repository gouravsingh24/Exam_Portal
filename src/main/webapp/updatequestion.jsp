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
<title>Manage Question</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>


<center>
		<h3>
			<pre>
				<font color="blue">List of all questions</font>
		
		</h3>
		</pre>
	</center>
	<table class="table table-bordered table-hover">
		<tr class="table-dark">
			<th>sl no.</th>
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
  {  if(request.getParameter("ques").equals(e.getQuestion())) 
	{
      %>
		
		<tr class="table-primary">
			<form action="updatequestionnow.jsp">
				<input type="hidden" value="<%=e.getQuestion()%>" type="text"
					name="quesoriginal">
				<td><%=i++%></td>
				<td><input type="text" value="<%=e.getQuestion()%>"
					name="quesmodified"></input></td>
				<td><input type="text" value=<%=e.getA() %> name="opta"></input>
				</td>
				<td><input type="text" value=<%=e.getB() %> name="optb"></input>
				</td>
				<td><input type="text" value=<%=e.getC() %> name="optc"></input>
				</td>
				<td><input type="text" value=<%=e.getD() %> name="optd"></input>
				</td>
				<td><input type="text" value=<%=e.getAns() %> name="ans"></input>
				</td>
				<td><input type="submit" value="update"></td>
				<td><a href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
			</form>
		</tr>
		<%	
	}
	else
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
  }
  %>
		
	</table>

</body>
</html>