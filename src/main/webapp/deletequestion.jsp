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
</head>
<body>
<%
		Question q = new Question();
		q.setQuestion(request.getParameter("ques"));
		int status = QuestionDao.deleteRecord(q);
		if(status > 0)
			response.sendRedirect("adminQuestion.jsp");
		else
			out.print("Error");
		
	%>
</body>
</html>