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
 * Servlet implementation class UploadDailyData
 */
@WebServlet("/UploadDailyData")
public class UploadDailyData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadDailyData() {
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

		String name=request.getParameter("uname");
		String email=request.getParameter("email");
		String date=request.getParameter("date");
		String shift=request.getParameter("shift");
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String wm=request.getParameter("wm");
		String bw=request.getParameter("bw");
		String tm=request.getParameter("tm");
		String mat=request.getParameter("mat");
		String mo=request.getParameter("mo");
		String nes=request.getParameter("nes");
		String tv=request.getParameter("tv");
		String lap=request.getParameter("lap");
		UserBean u=new UserBean();
		u.setUname(name);
		u.setEmail(email);
		u.setDate(date);
		u.setShift(shift);
		u.setFrom(from);
		u.setTo(to);
		u.setWm(wm);
		u.setBw(bw);
		u.setTm(tm);
		u.setMat(mat);
		u.setMo(mo);
		u.setNes(nes);
		u.setTv(tv);
		u.setLap(lap);
		int i;
		try {
			i = DBConnect.setData(u);
			if(i>0)
			{
				out.println("<script type=\"text/javascript\">");
			       out.println("alert('data uploaded successfully');");
			       out.println("window.location='uploadData.jsp'</script>");
			}else
			{
				out.println("<script type=\"text/javascript\">");
			       out.println("alert('failed to upload data');");
			       out.println("window.location='uploadData.jsp'</script>");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
