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



<%@page import="com.wipro.model.InstructionsDao"%>
<%@page import="com.wipro.bean.Instructions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Instruction</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
<%@include file="components/navbar.jsp"%>
<%
		Instructions i = new Instructions();
		i.setInstruction(request.getParameter("inst"));
		int status = InstructionsDao.deleteRecord(i);
		if(status > 0)
			response.sendRedirect("adminInstruction.jsp");
		else
			out.print("Error");
		
	%>

</body>
</html>