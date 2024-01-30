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

import com.beans.DoctorBean;
import com.beans.UserBean;
import com.controler.DBConnect;

/**
 * Servlet implementation class Urequest
 */
@WebServlet("/Urequest")
public class Urequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Urequest() {
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
		String did=request.getParameter("did");
		String demail=request.getParameter("demail");
		String dname=request.getParameter("dname");
		String des=request.getParameter("des");
		DoctorBean d=new DoctorBean();
		UserBean u=new UserBean();
		d.setEmail(demail);
		d.setId(did);
		d.setName(dname);
		HttpSession hs=request.getSession();
		String uemail=(String) hs.getAttribute("uemail");
		try {
			ResultSet r=DBConnect.getUser();
			while(r.next())
			{
				if(uemail.equals(r.getString(3)))
				{
					u.setId(r.getString(1));
					u.setEmail(uemail);
					u.setUname(r.getString(2));
					u.setAge(r.getString(5));
					u.setMobile(r.getString(4));
					u.setGender(r.getString(7));
					u.setDes(r.getString(8));
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			int i=DBConnect.ureq(u, d);		
			if(i>0)
			{
				out.println("<script type=\"text/javascript\">");
			       out.println("alert('request sended successfully');");
			       out.println("window.location='doctorslist.jsp'</script>");
			     
			}
			else
			{
				 out.println("<script type=\"text/javascript\">");
			       out.println("alert('failed to send request');");
			       out.println("window.location='doctorslist.jsp'</script>");
			 }


			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			 out.println("<script type=\"text/javascript\">");
		       out.println("alert('failed to send request');");
		       out.println("window.location='doctorslist.jsp'</script>");
		      

		
		}
	}

}
