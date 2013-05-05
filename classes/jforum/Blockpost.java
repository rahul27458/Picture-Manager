package jforum;

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

public class Blockpost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSet rs=null;
	  Statement st=null;
	  Connection conn = null;
	  
  
  public Blockpost() 
  {
	  st=Database.dbconnect();
  }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emd="";
		PrintWriter out=response.getWriter();
		String group_ids=request.getParameter("group_ids");
	   	Integer group_id=Integer.parseInt(group_ids);
		try
		{
			
			    String like_temp = request.getParameter("likeuid");
			    emd = request.getParameter("likeemd");	
				int like1=Integer.parseInt(like_temp);
				String sql1="UPDATE imageupload SET likes= likes + 1 WHERE image_id='"+like1+"'";
				String sqlret2="insert into likes values('"+like1+"','"+emd+"')";
				st.executeUpdate(sql1);
				st.executeUpdate(sqlret2);
		}
		catch (SQLException e) 
		{
				e.printStackTrace();
				out.println(e);
		}
		response.sendRedirect("GroupRedirect?user_id="+emd+"&group_ids="+group_id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String emd=""; 
		PrintWriter out=response.getWriter();
		String group_ids=request.getParameter("group_ids");
	   	Integer group_id=Integer.parseInt(group_ids);
		try
		{
				String report_temp = request.getParameter("reportuid");		
				emd = request.getParameter("reportemd");	
				int report1=Integer.parseInt(report_temp);
		        String sql1="UPDATE imageupload SET report= report + 1 WHERE image_id='"+report1+"'";
			    String sqlret2="insert into reports values('"+report1+"','"+emd+"')";
			    st.executeUpdate(sql1);
				st.executeUpdate(sqlret2);
		}
		catch(SQLException e){
			out.println(e);
		}
		
		
		response.sendRedirect("GroupRedirect?user_id="+emd+"&group_ids="+group_id);

		
	}

}
