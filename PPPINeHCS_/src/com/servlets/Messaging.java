package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controler.DBConnect;

/**
 * Servlet implementation class Messaging
 */
@WebServlet("/Messaging")
public class Messaging extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Messaging() {
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
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String date=new Date().toLocaleString();
		String message=request.getParameter("msg");
		Connection con=DBConnect.connect();
		try {
			PreparedStatement p=con.prepareStatement("insert into msg values(0,?,?,?,?)");
			p.setString(1, from);
			p.setString(2, to);
			p.setString(3, date);
			p.setString(4, message);
			int i=p.executeUpdate();
			if(i>0)
			{
				   out.println("<script type=\"text/javascript\">");
			       out.println("alert('message sent successfully');");
			       out.println("window.location='fpsAtD.jsp'</script>");
			     
			}else{
				   out.println("<script type=\"text/javascript\">");
			       out.println("alert('failed to sent message');");
			       out.println("window.location='fpsAtD.jsp'</script>");
			      

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			   out.println("<script type=\"text/javascript\">");
		       out.println("alert('failed to sent message');");
		       out.println("window.location='fpsAtD.jsp'</script>");
		      
		}

		
		
		
	}

}
