package com.wipro.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.bean.Question;
import com.wipro.model.QuestionDao;

/**
 * Servlet implementation class QuestionServlet
 */
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionServlet() {
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
		String question = request.getParameter("question");
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		String c = request.getParameter("c");
		String d = request.getParameter("d");
		String ans = request.getParameter("ans");

		Question r = new Question(question,a,b,c,d,ans);

		QuestionDao qdao = new QuestionDao();

		boolean status = qdao.question(r);
		HttpSession session = request.getSession();

		if (status) {
			session.setAttribute("message", "Question Added ");
			response.sendRedirect("admin.jsp");
			return;
		}else {
			session.setAttribute("messages", "Question not Added ");
			response.sendRedirect("admin.jsp");
		}
	}

}
