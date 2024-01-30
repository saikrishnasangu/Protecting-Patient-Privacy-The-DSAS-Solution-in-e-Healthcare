package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.DoctorBean;
import com.beans.UserBean;
import com.controler.DBConnect;

/**
 * Servlet implementation class AddDoctor
 */
@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddDoctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mob");
		String spe = request.getParameter("spe");
		String exp = request.getParameter("exp");
		String pass = request.getParameter("pass");
		String gender = request.getParameter("gen");
		DoctorBean u = new DoctorBean();
		u.setSpe(spe);
		u.setName(name);
		u.setEmail(email);
		u.setMobile(mobile);
		u.setPass(pass);
		u.setExp(exp);
		u.setGender(gender);
		try {
			int i = DBConnect.addDoctor(u);

			if (i > 0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('doctor added successfully');");
				out.println("window.location='adminhome.jsp'</script>");

			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('failed to add doctor');");
				out.println("window.location='adminhome.jsp'</script>");

			}

			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			out.println("<script type=\"text/javascript\">");
			out.println("alert('failed to add doctor');");
			out.println("window.location='adminhome.jsp'</script>");

		}

	}

}
