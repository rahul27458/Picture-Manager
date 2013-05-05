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
 * Servlet implementation class ForgotPwd
 */
public class ForgotPwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 ResultSet rs=null;
	 Statement st=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPwd() {
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
		boolean p=false;
		String hint_answer="";
		
		String hint_a=request.getParameter("hint_text");
		String email=request.getParameter("email");
		String sql="select hint_a from user_detail where email_id='"+email+"'";
		
		
		try {
			rs=st.executeQuery(sql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		try {
			if(rs.next())
			{
				
				hint_answer=rs.getString("hint_a");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  

		if(hint_answer.equalsIgnoreCase(hint_a))
		{
			p=true;
			
			response.sendRedirect("Login/forgotpassword.jsp?p="+p+"&email="+email);
		}
		else
		{
			out.println("Wrong answer");
		}
		
	}

}
