package com.wipro.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.bean.Login;
import com.wipro.model.CheckAdmin;
import com.wipro.model.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String name = request.getParameter("uname");
		String password = request.getParameter("pass");
		
		Login lg = new Login(name,password);
		
		LoginDao dao = new LoginDao();
		
		boolean status = dao.Validate(lg);
		HttpSession session = request.getSession();
		
		if(status) {
			
			//hide user data in http session
			
			session.setAttribute("current_user", lg);
			
			CheckAdmin cd = new CheckAdmin();
			String type = cd.checkAd(name, password);
			
			session.setAttribute("type", type);
			
			if(type.equals("admin")) {
				response.sendRedirect("admin.jsp");
			}else{
				response.sendRedirect("normal.jsp");
			}
			
			//admin.jsp
			
			
			// normal.jsp
			
			
			
			
		}else {
			session.setAttribute("message", "Wrong Credentials");
			response.sendRedirect("login.jsp");
		}
	}

}
