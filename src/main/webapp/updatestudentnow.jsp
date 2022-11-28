<%@page import="com.wipro.model.InstructionsDao"%>
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
</head>
<body>

<%
		String newuserid = request.getParameter("uname");
String newemail = request.getParameter("email");
        String newpassword = request.getParameter("pass");
        
        String originaluid = request.getParameter("usernameoriginal");
        String newphone = request.getParameter("phone");
        String newaddress = request.getParameter("address");
        String newtype = request.getParameter("type");
		int status = AdminUserDao.updateUser(originaluid, newuserid,newemail, newpassword, newphone, newaddress, newtype);
		if(status > 0)
		{ 
			response.sendRedirect("adminManage.jsp");
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