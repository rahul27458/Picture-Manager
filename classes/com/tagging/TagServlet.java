package com.tagging;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.*;
/**
 * Servlet implementation class tagservlet
 */
public class TagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	  Statement st=null;
	  Connection conn = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TagServlet() {
    	st=Database.dbconnect();
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
		String posx1=request.getParameter("posx");
		String posy1=request.getParameter("posy");
		String posw1=request.getParameter("posw");
		String posh1=request.getParameter("posh");
		double posx=Double.parseDouble(posx1);
		double posy=Double.parseDouble(posy1);
		double posw=Double.parseDouble(posw1);
		double posh=Double.parseDouble(posh1);
		int image_id=1;
		String tag_name=request.getParameter("tag_name");
		String sql="insert into tag (image_id,posx,posy,posw,posh,tag_name) values('"+image_id+"','"+posx+"','"+posy+"','"+posw+"','"+posh+"','"+tag_name+"')";
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	
	}

}
