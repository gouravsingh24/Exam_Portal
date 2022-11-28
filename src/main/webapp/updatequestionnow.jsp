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


<%@page import="com.wipro.model.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%      
        String OriginalQuestion = request.getParameter("quesoriginal");
		String newQuestion = request.getParameter("quesmodified");
        String opta = request.getParameter("opta");
        String optb = request.getParameter("optb");
        String optc = request.getParameter("optc");
        String optd = request.getParameter("optd");
        String ans = request.getParameter("ans");
		int status =QuestionDao.doUpdateNowRecord(OriginalQuestion,newQuestion,opta,optb,optc,optd,ans);
		if(status > 0)
		{
			response.sendRedirect("adminQuestion.jsp");
		}
		else if(status == -1)
		{
			out.print("error from databse");
			
		}
		else
		{
			out.print("excepion occured");
		}
		
	%>

</body>
</html>