package com.Discussion;



import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.*;

/**
 * Servlet implementation class DiscussionRedirect
 */
public class DiscussionRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs,rs1;
	Statement st,st1;
		 
	PrintWriter out ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscussionRedirect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
			out = response.getWriter();
			st=Database.dbconnect();
			st1=Database.dbconnect();
			String user_ids=request.getParameter("user_ids");
			int user_id=Integer.parseInt(user_ids);
			out.println("This is redirect"+user_ids);
			String group_ids=request.getParameter("group_ids");
			int group_id=Integer.parseInt(group_ids);
			
			
			try {
				
					String sql1="select * from groups where user_id='"+user_id+"' AND group_id='"+group_id+"'";
					rs1=st1.executeQuery(sql1);
					
					 
					 if(rs1.next())
					 {
						 out.println("user is admin");
						 RequestDispatcher dispatcher = request.getRequestDispatcher("groups.jsp?group_id="+group_id);
					
					 if (dispatcher != null)
					 {
						  dispatcher.forward(request, response);
					  }
					 }
					 else
					 {
						 out.println("user is member");
						 RequestDispatcher dispatcher = request.getRequestDispatcher("groupmember.jsp?group_id="+group_id);
							
							 if (dispatcher != null)
							 {
								  dispatcher.forward(request, response);
							  }
					 }
					
			} catch (Exception e) {
				out.println(e);
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
		// TODO Auto-generated method stub
	}

}
