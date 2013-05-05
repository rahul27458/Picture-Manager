package homepage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.connection.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeVideoBlockPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSet rs=null;
	  Statement st=null;
	  Connection conn = null;
	  
  String user_id="";
  public HomeVideoBlockPost() 
  {
	  st=Database.dbconnect();
  }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emd="";
		PrintWriter out=response.getWriter();
	
		try
		{
			
			    String like_temp = request.getParameter("likeuid");
			    emd = request.getParameter("likeemd");	
			    user_id=emd;
				int like1=Integer.parseInt(like_temp);
				String sql1="UPDATE videoupload SET likes= likes + 1 WHERE video_id='"+like1+"'";
				String sqlret2="insert into v_likes values('"+like1+"','"+emd+"')";
				st.executeUpdate(sql1);
				st.executeUpdate(sqlret2);
		}
		catch (SQLException e) 
		{
				e.printStackTrace();
				out.println(e);
		}
		
		response.sendRedirect("homepage.jsp?user_id="+user_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String emd=""; 
		PrintWriter out=response.getWriter();
		
		try
		{
				String report_temp = request.getParameter("reportuid");		
				emd = request.getParameter("reportemd");
				user_id=emd;
				int report1=Integer.parseInt(report_temp);
		        String sql1="UPDATE videoupload SET report= report + 1 WHERE video_id='"+report1+"'";
			    String sqlret2="insert into v_reports values('"+report1+"','"+emd+"')";
			    st.executeUpdate(sql1);
				st.executeUpdate(sqlret2);
		}
		catch(SQLException e){
			out.println(e);
		}
		
		
		response.sendRedirect("homepage.jsp?user_id="+user_id);

		
	}

}
