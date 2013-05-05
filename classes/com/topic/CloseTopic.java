package com.topic;

import java.io.IOException;	
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Database;

/**
 * Servlet implementation class CloseTopic
 */
public class CloseTopic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CloseTopic() {
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
		String post_ids=request.getParameter("post_id");
		String user_ids=request.getParameter("user_id");
		int post_id=Integer.parseInt(post_ids);
		
	
		Statement st=null;
		try{ st=Database.dbconnect();
			String sql="update post set topicstatus=1 where post_id='"+post_id+"'";
			int i=st.executeUpdate(sql);
		if(i!=0)
		{
			response.sendRedirect("discussionroom/discussion.jsp?user_id="+user_ids);
		}
		else{
			System.out.print("Error");
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
	}

}
