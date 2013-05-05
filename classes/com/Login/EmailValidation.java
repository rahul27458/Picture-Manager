package com.Login;

import java.io.IOException;

import java.sql.SQLException;
import java.sql.Statement;
import com.connection.Database;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailValidation
 */
public class EmailValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Statement st=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailValidation() {
    	st=Database.dbconnect();	
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
		String email_id=request.getParameter("email_id");
		System.out.println("email is:"+email_id);
		String sql="UPDATE user_detail SET activation=1 WHERE email_id='"+email_id+"'";
		
		try {
			st.executeUpdate(sql);
			response.sendRedirect("http://localhost:8080/xyz/Login/Login.jsp");
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
