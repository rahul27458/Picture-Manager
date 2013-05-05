package homepage;



import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.connection.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HomeVideoCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSet rs=null;
	  Statement st=null;
	  
    
	  
	public HomeVideoCommentServlet() 
	{
    	st=Database.dbconnect();    
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
		
		String video_ids = request.getParameter("video_id");	
		String comment_text = request.getParameter("comment_text");	
		String user_ids = request.getParameter("user_id");	
		
		
	
		int user_id=Integer.parseInt(user_ids);
		int video_id=Integer.parseInt(video_ids);
		
		 String sql="insert into v_comments values ('"+video_id+"','"+comment_text+"','"+user_id+"')";
		  
		    try {
				st.executeUpdate(sql);
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}
		    
			response.sendRedirect("homepage.jsp?user_id="+user_ids);
	}

}
