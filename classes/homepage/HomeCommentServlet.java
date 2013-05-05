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


public class HomeCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSet rs=null;
	  Statement st=null;
	  
    
	  
	public HomeCommentServlet() 
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
		
		String image_ids = request.getParameter("image_id");	
		String comment_text = request.getParameter("comment_text");	
		String user_ids = request.getParameter("user_id");	
		
		
	
		int user_id=Integer.parseInt(user_ids);
		int image_id=Integer.parseInt(image_ids);
		
		 String sql="insert into comments values ('"+image_id+"','"+comment_text+"','"+user_id+"')";
		  
		    try {
				st.executeUpdate(sql);
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}
		    
			response.sendRedirect("homepage.jsp?user_id="+user_ids);
	}

}
