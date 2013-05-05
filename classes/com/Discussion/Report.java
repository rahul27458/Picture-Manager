package com.Discussion;

import java.io.IOException;	
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Database;

/**
 * Servlet implementation class Report
 */
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
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
		// TODO Auto-generated method stub
	      Statement statement=null;
	     
		  String user_id=request.getParameter("user_id");
	      String post_id=request.getParameter("post_id");
	      String sql="update post set no_of_reports=no_of_reports+1 where post_id="+post_id;
	      try{
	    	  statement=Database.dbconnect();
	    	  int i=statement.executeUpdate(sql);
	    	  if(i!=0){
	    		  // to update report table about which user id has repored so that he cannot report the post again
	    		
	    		  
	    		  //ResultSet rs2=null;
	    		  Statement st2=null;
	    		  try{
	    		String sql2="insert into post_report values('"+user_id+"','"+post_id+"')";
	    		  st2=Database.dbconnect();
	    		  int j=st2.executeUpdate(sql2);
	    		  if(j!=0)
	    		  {
	    			  response.sendRedirect("discussionroom/discussion.jsp?user_id="+user_id);  
	    		  }else{
	    			  response.getWriter().print("Error in insert");
	    		  }
	    		  }catch(SQLException e){
	    			  e.printStackTrace();
	    		  }
	    	  }else {
				response.getWriter().print("Error");
			}
	      }catch(SQLException e){
	    	  e.printStackTrace();
	      }
	      
	}

}
