/*
 Used to check current password 
 and update to new password
 */
package com.password;

import java.io.IOException;	
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.AES.AESencrp;


/**
 * Servlet implementation class PasswordCheck
 */
public class PasswordCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordCheck() {
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
		String user_password=request.getParameter("current_password");
		try {
			user_password=AESencrp.encrypt(user_password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String new_password=request.getParameter("new_password");	
		try {
			new_password=AESencrp.encrypt(new_password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String user_ids=request.getParameter("user_id");
		int user_id=Integer.parseInt(user_ids);
	   
		

		//validate password
					
			    	if(PasswordChecker.validate(user_password,user_id)){
			    		if(PasswordChecker.passwordUpdate(new_password,user_id))
			    		{
			    	response.sendRedirect("Profile/display_profile.jsp?user_id="+user_id);
			    		
			    		}
			    		else{
			    			response.sendRedirect("Profile/changePassword.jsp?message=Invalid Password check whether you have entered proper old password or check whether newpassword and current password matches&user_id="+user_id);
			    		
			    		}
			    	}
			    	else{
			    		response.sendRedirect("Profile/changePassword.jsp?message=Invalid Password check whether you have entered proper old password or check whether newpassword and current password matches&user_id="+user_id);
			    	
    			    	}
			    
				
		
		}
		
	}


