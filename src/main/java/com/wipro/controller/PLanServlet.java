package com.wipro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wipro.bean.Plan;
import com.wipro.model.PlanDao;

/**
 * Servlet implementation class PLanServlet
 */
public class PLanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PLanServlet() {
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
		String plans = request.getParameter("plan");
		String bank = request.getParameter("select");
		String account = request.getParameter("account");

		String plan = null;
		if (plans.equals("1")) {
			plan = "free";
		}
		if (plans.equals("2")) {
			plan = "basic";
		}
		if (plans.equals("3")) {
			plan = "premium";
		}

		// Database

		Plan pl = new Plan(account, bank, plan);

		PlanDao dao = new PlanDao();
		dao.insert(pl);

		// Redirect purpose
		if (plans.equals("1")) {
			response.sendRedirect("StudentInst.jsp");
		} else if (plans.equals("2")) {
			response.sendRedirect("StudentInst.jsp");
		} else if (plans.equals("3")) {
			response.sendRedirect("StudentInst.jsp");
		}
	}

}
