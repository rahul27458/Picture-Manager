package com.passforgot;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.*;
/**
 * Servlet implementation class EmailForgotPwd
 */
public class EmailForgotPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 ResultSet rs=null;
	 Statement st=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailForgotPwd() {
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
		PrintWriter out=response.getWriter();
		String question="";
		String email=request.getParameter("useremail");
		String sql="Select hint_q from user_detail where email_id='"+email+"'";
		try {
			rs=st.executeQuery(sql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		try {
			if(rs.next())
				question=rs.getString("hint_q");
			out.println("question:"+question);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
			response.sendRedirect("Login/forgotpassword.jsp?question="+question+"&email="+email);
	}

}
