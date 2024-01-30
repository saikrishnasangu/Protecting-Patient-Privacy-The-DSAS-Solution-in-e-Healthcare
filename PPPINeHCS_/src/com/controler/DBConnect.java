package com.controler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.beans.DoctorBean;
import com.beans.UserBean;

import java.sql.PreparedStatement;

public class DBConnect {
	public static Connection connect() {
		Connection con = null;
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/vtjdm13_2022","root","rootroot");
			return con;
		}catch(ClassNotFoundException e)
		{
			e.printStackTrace();
			return con;


    

	

	}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
			return con;
		}
	}
	
	public static int setData(UserBean u) throws SQLException
	{
		Connection con=DBConnect.connect();
		PreparedStatement p=con.prepareStatement("insert into data values(0,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		p.setString(1, u.getUname());
		p.setString(2, u.getEmail());
		p.setString(3, u.getDate());
		p.setString(4, u.getShift());
		int du=Integer.parseInt(u.getTo())-Integer.parseInt(u.getFrom());
		p.setString(5, String.valueOf(du));
		p.setString(6, u.getWm());
		p.setString(7, u.getBw());
		p.setString(8, u.getTm());
		p.setString(9, u.getMat());
		p.setString(10, u.getMo());
		p.setString(11, u.getNes());
		p.setString(12, u.getTv());
		p.setString(13, u.getLap());
		int i=p.executeUpdate();
		return i;
	}

	public static int regUser(UserBean u) throws SQLException
	{
		Connection con=DBConnect.connect();
		PreparedStatement p=con.prepareStatement("insert into user values(0,?,?,?,?,?,?,?)");
		p.setString(1, u.getUname());
		p.setString(2, u.getEmail());
		p.setString(3, u.getMobile());
		p.setString(4, u.getAge());
		p.setString(5, u.getPass());
		p.setString(6, u.getGender());
		p.setString(7, u.getDes());
		int i=p.executeUpdate();
		return i;
	}

	public static int addDoctor(DoctorBean u) throws SQLException
	{
		Connection con=DBConnect.connect();
		PreparedStatement p=con.prepareStatement("insert into doctor values(0,?,?,?,?,?,?,?)");
		p.setString(1, u.getName());
		p.setString(2, u.getEmail());
		p.setString(3, u.getMobile());
		p.setString(4, u.getSpe());
		p.setString(5, u.getExp());
		p.setString(6, u.getPass());
		p.setString(7, u.getGender());
		int i=p.executeUpdate();
		return i;
	}
	
	public static ResultSet getUser() throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select * from user");
		return r;
	}
	
	public static ResultSet getDoctor() throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select * from doctor");
		return r;
	}
	
	public static ResultSet getUReq() throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select * from ureq");
		return r;
	}

	public static int getCount(String Date,String c) throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("SELECT SUM("+c+") FROM DATA WHERE DATE='"+Date+"';");
		int i=0;
		
		if(r.next())
		{
			i= r.getInt(1);
		}else
		{
		i=0;
		}
		r.close();
		s.close();
		con.close();
		return i;		
	}
	public static ResultSet getCons() throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select * from connects");
		return r;
	}

	public static ResultSet getFps() throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select * from data");
		return r;
	}
	public static ResultSet getFpsByUser(String email) throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select distinct(date) from data where email='"+email+"'");
		return r;
	}
	
	public static int getTotelCount(String email) throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select count(distinct(date)) from data where email='"+email+"'");
		if(r.next())
		{
			return r.getInt(1);
		}else{
			return 0;
		}

		
	}
	
	public static ResultSet getMsg() throws SQLException
	{
		Connection con=DBConnect.connect();
		Statement s=con.createStatement();
		ResultSet r=s.executeQuery("select * from msg");
		return r;
	}
	
	public static int ureq(UserBean u,DoctorBean d) throws SQLException
	{
		Connection con=DBConnect.connect();
		PreparedStatement p=con.prepareStatement("insert into ureq values(0,?,?,?,?,?,?,?,?,?,?)");
		p.setString(1, d.getId());
		p.setString(2, d.getEmail());
		p.setString(3, d.getName());
		p.setString(4, u.getId());
		p.setString(5, u.getUname());
		p.setString(6, u.getEmail());
		p.setString(7, u.getMobile());
		p.setString(8, u.getAge());
		p.setString(9, u.getGender());
		p.setString(10, u.getDes());
		int i=p.executeUpdate();
		return i;
	}
	
}
