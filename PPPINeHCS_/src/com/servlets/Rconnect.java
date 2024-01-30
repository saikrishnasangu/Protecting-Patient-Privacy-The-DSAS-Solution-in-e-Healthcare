package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controler.DBConnect;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Rconnect
 */
@WebServlet("/Rconnect")
public class Rconnect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rconnect() {
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
			String rid=request.getParameter("rid");
			String uemail=request.getParameter("uemail");
			String demail=request.getParameter("demail");
			String uname=request.getParameter("uname");
			String dname=request.getParameter("dname");
			Connection con=DBConnect.connect();
			try {
				java.sql.PreparedStatement p=con.prepareStatement("insert into connects values(0,?,?,?,?)");
				p.setString(1, demail);
				p.setString(3, uemail);
				p.setString(2, dname);
				p.setString(4, uname);
				int i=p.executeUpdate();
				if(i>0)
				{
					Statement s=con.createStatement();
					int j=s.executeUpdate("delete from ureq where id="+rid);
					if(j>0)
					{
						out.println("<script type=\"text/javascript\">");
					       out.println("alert('connected to user successfully');");
					       out.println("window.location='urequests.jsp'</script>");
					}else{
						out.println("<script type=\"text/javascript\">");
					       out.println("alert('failed to connect user');");
					       out.println("window.location='urequests.jsp'</script>");
					}
				}else{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('failed to connect user');");
				       out.println("window.location='urequests.jsp'</script>");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.println("<script type=\"text/javascript\">");
				out.println("alert('failed to connect user');");
			       out.println("window.location='doctorslist.jsp'</script>");
			}
	}

}
