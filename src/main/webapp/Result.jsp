<%@page import="com.wipro.bean.Login"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.bean.Login"%>
<%@page import="com.wipro.bean.*" %>
<%@page import="com.wipro.model.*" %>
<%
Login lg = (Login) session.getAttribute("current_user");
String name = lg.getName();
name = name.toUpperCase();
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
<title>Result</title>
<style type="text/css">



</style>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

<%@include file="components/navbar.jsp"%>
<% 

String[] dbans = new String[100];
ArrayList<Question> allQuestions = QuestionDao.getAllRecords();
int i = 0;
int size = allQuestions.size();
for(Question e : allQuestions)
{   
	dbans[i] = e.getAns();
	  i++;
}
String[] userans = new String[100];
for(int j = 0 ; j < size ; j++)
{
	userans[j] = request.getParameter(Integer.toString(j));
}
int correctanswer=0;
int unattempted = 0;
int wronganswer=0;
for(int k = 0 ; k< size;k++)
{
	if(userans[k].equalsIgnoreCase(dbans[k]))
	{
		correctanswer++;
	}
	else if(userans[k].equals("e"))
	{
		unattempted++;
	}
	else
	{
		wronganswer++;
	}
}
int attemped = size - unattempted;
%>




<div class = "mim" style="background-color: #4BE7B0;">
		<pre>
			<h1>
				<center>
					<font color="green"><center><h1>Result</h1></center></font>
				</center>
			</h1>
		</pre>
	</div>
	<%



%>
	<table class="table table-hover">
		<thead>
			<tr class="table-warning">
				<th colspan="3" scope="col"><center>
						<pre>
							<h4>Name:-<%=name %> </h4>
						</pre>
					</center></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Total no. of Questions</td>
				<td><%=size %></td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>Number Of Questions Attempted</td>
				<td><%=attemped %></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>Number of Correct Answers</td>
				<td><h4>
						<font color="green"><%=correctanswer %>
					</h4> </font></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td>Number of Wrong Answers</td>
				<td><font color="red"><h4><%=attemped-correctanswer %></h4></font></td>
			</tr>
		</tbody>
	</table>
	<center>
		<input onclick="location.href='normal.jsp'"
			type="button" value="Exit" class="btn btn-outline-danger btn-lg">
	</center>



</body>
</html>