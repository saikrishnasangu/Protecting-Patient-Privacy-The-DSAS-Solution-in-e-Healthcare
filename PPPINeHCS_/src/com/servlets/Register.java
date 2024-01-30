package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.UserBean;
import com.controler.DBConnect;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mob");
		String age=request.getParameter("age");
		String pass=request.getParameter("pass");
		String gender=request.getParameter("gen");
		String des=request.getParameter("des");
		UserBean u=new UserBean();
		u.setAge(age);
		u.setUname(name);
		u.setEmail(email);
		u.setMobile(mobile);
		u.setPass(pass);
		u.setGender(gender);
		u.setDes(des);
		try {
			int i=DBConnect.regUser(u);
			if(i>0)
			{
				out.println("<script type=\"text/javascript\">");
			       out.println("alert('Registration successfull');");
			       out.println("window.location='login.jsp'</script>");
			     
			}else{
				 out.println("<script type=\"text/javascript\">");
			       out.println("alert('invalid username or password');");
			       out.println("window.location='reg.jsp'</script>");
			      

			}		} catch (SQLException e) {
			// TODO Auto-generated catch block
				 out.println("<script type=\"text/javascript\">");
			       out.println("alert('invalid username or password');");
			       out.println("window.location='reg.jsp'</script>");

		}
		
		
	}

}
