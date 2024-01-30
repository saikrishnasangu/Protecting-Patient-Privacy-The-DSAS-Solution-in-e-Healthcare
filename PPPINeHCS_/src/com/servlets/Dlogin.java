package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controler.DBConnect;

/**
 * Servlet implementation class Dlogin
 */
@WebServlet("/Dlogin")
public class Dlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dlogin() {
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
		int count=0;
		PrintWriter out=response.getWriter();
		HttpSession hs=request.getSession();
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		try {
			ResultSet r=DBConnect.getDoctor();
			while(r.next())
			{
				if(email.equals(r.getString(3))&&pass.equals(r.getString(7)))
				{
					count++;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			 out.println("<script type=\"text/javascript\">");
		       out.println("alert('invalid username or password');");
		       out.println("window.location='login.jsp'</script>");
		}
		
		
		if(count>0)
		{hs.setAttribute("demail", email);
			response.sendRedirect("doctorhome.jsp");
		}else{
			 out.println("<script type=\"text/javascript\">");
		       out.println("alert('invalid username or password');");
		       out.println("window.location='login.jsp'</script>");
		      

		}
	}

}
