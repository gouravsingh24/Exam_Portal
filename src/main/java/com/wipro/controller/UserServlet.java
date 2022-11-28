package com.wipro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.bean.Register;
import com.wipro.model.RegisterDao;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		String uname = request.getParameter("uname");
		String email = request.getParameter("email");
		String pass = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		Register r = new Register(uname, email, pass, phone, address, "normal");

		RegisterDao rdao = new RegisterDao();

		boolean status = rdao.register(r);
		HttpSession session = request.getSession();

		if (status) {
			session.setAttribute("message", "User Added ");
			response.sendRedirect("admin.jsp");
			return;
		}else {
			session.setAttribute("messages", "User not Added ");
			response.sendRedirect("admin.jsp");
		}	}

}
