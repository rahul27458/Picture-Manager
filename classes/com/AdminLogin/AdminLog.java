/*
 Used for admin login
*/
package com.AdminLogin;

import java.io.IOException;	
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLog
 */
public class AdminLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLog() {
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
		String user_email=request.getParameter("f_name");
		String user_password=request.getParameter("f_password");
		HttpSession session=request.getSession(true);
		

		//validate user
					    
			    	if(AdminCheck.validate(user_email,user_password)){
			    		session.setAttribute("user_email", user_email);
			    		response.sendRedirect("admin/admin_homepage.jsp");
			    	}
			    	else{
			    		response.sendRedirect("admin/admin_login.jsp?message=Invalid Username or Password");
			    		
    			    	}
			    
	}

}
