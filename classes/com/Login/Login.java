package com.Login;
	
import java.io.IOException;		
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.AES.AESencrp;
import com.connection.Database;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
     /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultSet rs=null,rs2=null;
        String email_id=request.getParameter("useremail");
		String user_password2=request.getParameter("password");
		Statement st=Database.dbconnect();	
		Statement st2=Database.dbconnect();	
     String user_password="";
        	try {
        			//aes encryption for user_password
					user_password=AESencrp.encrypt(user_password2);
					
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
    
		//validate user
        		String activate=LoginCheck.validate(email_id,user_password);
        		
        		
        		if(activate=="validated"){
			    		
					    try {
				    		String sql="select user_id,loggedin from user_detail where email_id='"+email_id+"'";
				    	     
                            int user_id=0,loggedin=1;
                            String user_id_s="";
							rs=st.executeQuery(sql);
						    if(rs.next())
						    {
			    		       user_id=rs.getInt("user_id");
			    		       user_id_s=Integer.toString(user_id);
			    		       String sql2="update user_detail set loggedin=1 where user_id="+user_id;
			    		       rs2=st2.executeQuery(sql2);
			    		       if(rs2.next())
			    		       {
			    		       response.sendRedirect("homepage.jsp?user_id="+user_id_s+"&loggedin="+loggedin);
			    		       }
						    }
						    else{
						    	System.out.print("not found");
						    }
						//session.setAttribute("user_id",user_id_s);
			    		
					    } catch (SQLException e) {
							
							e.printStackTrace();
						}finally{
							try{
							if(rs==null){
								rs.close();
							}
							if(st==null){
								st.close();
							}
							}catch(Exception e){
								e.printStackTrace();
							}
						}
			    	}
			    	else if(activate=="wrongdetails"){
			    		response.sendRedirect("Login/Login.jsp?message=Invalid Username or Password");
			    		
    			    	}
			    	else
			    	{
			    		response.sendRedirect("Login/Login.jsp?message=Email activation pending");
			    	}
			    
				
		
		}
		
	}


