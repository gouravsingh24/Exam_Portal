package com.wipro.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wipro.bean.Instructions;
import com.wipro.model.InstructionsDao;

/**
 * Servlet implementation class InstructionServlet
 */
public class InstructionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstructionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String instro = request.getParameter("instruction");
		Instructions ins = new Instructions(instro);
		ins.setInstruction(instro);

		InstructionsDao idao = new InstructionsDao();
		boolean status = idao.addInstructions(ins);

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		if (status) {
			session.setAttribute("message", "Instruction Added");
			response.sendRedirect("admin.jsp");
			return;
		} else {
			session.setAttribute("messages", "Instruction Not Added");
			response.sendRedirect("admin.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String instruction = request.getParameter("instruction");
		Instructions ins = new Instructions();
		ins.setInstruction(instruction);

		InstructionsDao idao = new InstructionsDao();
		boolean status = idao.addInstructions(ins);

		HttpSession session = request.getSession();

		if (status) {
			session.setAttribute("message", "Instruction Added");
			response.sendRedirect("admin.jsp");
			return;
		} else {
			session.setAttribute("messages", "Instruction Not Added");
			response.sendRedirect("admin.jsp");
		}
	}

}
