package com.profile;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.FREE_MEM;

import com.connection.Database;

/**
 * Servlet implementation class AddFriend
 */
public class AddFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFriend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// to remove a particular friend
		String user_id_s=request.getParameter("user_id");
		String friend_id_s=request.getParameter("friend_id");
		int user_id=Integer.parseInt(user_id_s);
		int friend_id=Integer.parseInt(friend_id_s);
		
		Statement st=null,st2=null,st3=null;
		try{
			st=Database.dbconnect();
			st2=Database.dbconnect();
			st3=Database.dbconnect();
			String sql="delete from user_friend where user_id='"+user_id+"' and friend_id='"+friend_id+"'";
			String sql2="delete from user_friend where user_id='"+friend_id+"' and friend_id='"+user_id+"'";
			String description="friends";
			int i=st.executeUpdate(sql);
			int j=st2.executeUpdate(sql2);
			if(i!=0 && j!=0)
			{ String sql3="delete from notification where user_id='"+user_id+"' and friend_id='"+friend_id+"' and description='"+description+"'";
			  int k=st3.executeUpdate(sql3);
			  if(k!=0)
			  {
				  response.sendRedirect("Profile/see_profile.jsp?user_id="+user_id+"&friend_id="+friend_id);
			  }
			   }else{
				response.getWriter().print("Error updating data");
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
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
				
				Statement st=null,st2=null,st3=null,st4=null;
				 String sql4="update user_detail set notify=1 where user_id=25";
				try{
					st=Database.dbconnect();
					st2=Database.dbconnect();
					st3=Database.dbconnect();
					st4=Database.dbconnect();
					String sql="insert into user_friend values('"+user_id+"','"+friend_id+"')";
					String sql2="insert into user_friend values('"+friend_id+"','"+user_id+"')";
					
					int i=st.executeUpdate(sql);
					int j=st2.executeUpdate(sql2);
					String description="friends";
					if(i!=0 && j!=0)
					{   
						String sql3="insert into notification(user_id,friend_id,description) values('"+user_id+"','"+friend_id+"','"+description+"')";
						int k=st3.executeUpdate(sql3);
						if(k!=0)
						{
						   int l=st4.executeUpdate(sql4);
						   if(l!=0)
						   {
						response.sendRedirect("Profile/see_profile.jsp?user_id="+user_id+"&friend_id="+friend_id);
						   }
						    }
					}else{
						response.getWriter().print("Error updating data");
					}
					
				}catch(SQLException e){
					e.printStackTrace();
				}
				
	}

}
