<%@page import="com.wipro.model.AdminUserDao"%>
<%@page import="com.wipro.bean.AdminUser"%>
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
<title>Insert title here</title>
</head>
<body>
<%
		AdminUser s = new AdminUser();
		s.setName(request.getParameter("username"));
		int status = AdminUserDao.deleteRecord(s);
		if(status > 0)
			response.sendRedirect("adminManage.jsp");
		else
			out.print("Error");
		
	%>
</body>
</html>