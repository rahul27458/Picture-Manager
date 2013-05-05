
package registration;

import com.AES.AESencrp;	
import com.connection.*;
import com.sappers.classes.EmailCheck;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Statement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registeruser
 */
public class registeruser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
      ResultSet rs;
	 Statement st;
	 Connection conn;
	String valid_form,unique_email,syntax_email,syntax_password,same_password,empty_fields;
	
    public registeruser() {
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
		
		 
		/*	String activate=request.getParameter("activate");*/
		//get all form parameters
		String first_name=request.getParameter("first_name");
		String last_name=request.getParameter("last_name");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");	
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String hint_q=request.getParameter("mydropdown");
		String hint_a=request.getParameter("hint_text");
		String password2="";
	    try {
			 password2=AESencrp.encrypt(password);
			
			/*String query1="insert into user_detail (fname,lname,gender,dob,email_id,user_password,hint_q,hint_a) values ('"+first_name+"','"+last_name+"','"+gender+"','"+dob+"','"+email+"','"+password+"','"+hint_q+"','"+hint_a+"')";*/

		String query1="insert into user_detail (fname,lname,gender,dob,email_id,user_password,hint_q,hint_a) values ('"+first_name+"','"+last_name+"','"+gender+"','"+dob+"','"+email+"','"+password2+"','"+hint_q+"','"+hint_a+"')";
	  
		
 
				     valid_form="valid";
							 
							   st.executeUpdate(query1);
							   valid_form="yes";
							//send activation link to email id
							   EmailCheck obj=new EmailCheck();
							 obj.emailSend(email);
							   
						   }
						   catch(Exception e)//if email id entered is not unique then db throws an exception as email id is UNIQUE
						   {
							   
							   e.printStackTrace();
							   unique_email="Email id already in use";
							   valid_form="no";
							   //request.setAttribute("unique_email",unique_email);
						   }
			 
			
	   if(valid_form=="yes")
		   {
		   
		   response.sendRedirect("Login/Login.jsp?activate");
		   
				
			   }
		   else
	   {
			   response.sendRedirect("registration/reginfo.jsp? unique_email="+ unique_email);
		   
				  
		   }

	}

}
