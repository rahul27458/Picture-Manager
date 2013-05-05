/*
  Handles Discussion form creating topics
   and post in a particular thread
 */
package com.Discussion;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class DiscussionServlet
 */
public class DiscussionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscussionServlet() {
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
		//insert in database and move to post threads
		
		String post_name=request.getParameter("nameOfTopic");
		String category=request.getParameter("category");
		String postdescription=request.getParameter("postdescription");
		String user_id_s=request.getParameter("user_id");
		int user_id=Integer.parseInt(user_id_s);
		   
		if(Discuss.dbInsert(post_name, category,postdescription,user_id))
		{
			response.sendRedirect("discussionroom/discussion.jsp?user_id="+user_id_s);
		}
		else{
    		response.sendRedirect("discussionroom/discussionForm.jsp?message=Cannot insert data");

		}
		
	  	
	}
}
