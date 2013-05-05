package com.profile;

import java.io.IOException;	
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Database;

/**
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
		// get session details
		String user_id_s=request.getParameter("user_id");
		String friend_id_s=request.getParameter("friend_id");
		int user_id=Integer.parseInt(user_id_s);
		int friend_id=Integer.parseInt(friend_id_s);
		
		Statement st=null;
		try{
			st=Database.dbconnect();
			String sql="insert into user_friend values('"+user_id+"','"+friend_id+"')";
			int i=st.executeUpdate(sql);
			if(i!=0)
			{
				response.sendRedirect("Profile/see_profile.jsp?user_id="+user_id+"&friend_id="+friend_id);
			}else{
				response.getWriter().print("Error updating data");
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		
	}

}
