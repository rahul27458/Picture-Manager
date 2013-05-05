package jforum;

import java.io.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.connection.*;

public class LeaveGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	  
    public LeaveGroup() {
    	
    	  
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		String user_ids=request.getParameter("user_id");
		int user_id=Integer.parseInt(user_ids);
		String group_ids=request.getParameter("group_ids");
		int group_id=Integer.parseInt(group_ids);
		
		//String gname=request.getParameter("gname");
		//delete for images
		
		if(true)
		{
			ResultSet rs=null;
			  Statement st=null,st1=null,st2=null,st3=null;
			 
			st=Database.dbconnect();  
	    	st1=Database.dbconnect(); 
	    	st2=Database.dbconnect(); 
	    	st3=Database.dbconnect();  
	    	
						String sql5="select image_id from imageupload where user_id='"+user_id+"' AND group_id='"+group_id+"'";
						try {
							rs=st.executeQuery(sql5);
							
						} 
						catch (SQLException e1) 
						{
							e1.printStackTrace();
						}
						try {
							while(rs.next())
							{
								int image_id=rs.getInt("image_id");
								
								String sql2="delete from comments where image_id='"+image_id+"'";
								st1.executeUpdate(sql2);
								String sql3="delete from reports where image_id='"+image_id+"'";
								st2.executeUpdate(sql3);
								String sql4="delete from likes where image_id='"+image_id+"'";
								st3.executeUpdate(sql4);
							}
						} 
						catch (SQLException e1) {
							
							
							e1.printStackTrace();
						}
						
						
	}
		//delete for video
	if(true);
	{
		ResultSet vrs=null;
		  Statement st1=null,st2=null,st3=null,vst=null;
		 
		
		st1=Database.dbconnect(); 
		st2=Database.dbconnect(); 
		st3=Database.dbconnect();  
		vst=Database.dbconnect();
		String vsql5="select video_id from videoupload where user_id='"+user_id+"' AND group_id='"+group_id+"'";
		try 
		{
			vrs=vst.executeQuery(vsql5);
		} 
		catch (SQLException e2) 
		{
			e2.printStackTrace();
		}
		try 
		{
			while(vrs.next())
			{
				int video_id=vrs.getInt("video_id");
				
				String sql2="delete from v_comments where video_id='"+video_id+"'";
				st1.executeUpdate(sql2);
				String sql3="delete from v_reports where video_id='"+video_id+"'";
				st2.executeUpdate(sql3);
				String sql4="delete from v_likes where video_id='"+video_id+"'";
				st3.executeUpdate(sql4);
			}
		
		} 
		
		
		catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		try {
			vrs.close();
			st1.close();
			st2.close();
			st3.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}		
		
//delete user details
if(true)
{
	
	  Statement st=null;
	 
	st=Database.dbconnect();  
	
	
	
		String sql="delete from user_group where user_id='"+user_id+"' AND group_id='"+group_id+"'";
		String sql1="delete from imageupload where user_id='"+user_id+"' AND group_id='"+group_id+"'";
		String sql2="UPDATE groups SET no_of_members = no_of_members - 1 WHERE group_id=1";
		String v_sql1="delete from videoupload where user_id='"+user_id+"' AND group_id='"+group_id+"'";
		
		out.println("leave:"+user_ids);
		try {
			st.executeUpdate(sql);
			st.executeUpdate(sql1);
			st.executeUpdate(sql2);
			st.executeUpdate(v_sql1);
			
		
		
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		try {
		
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("group/nonmember.jsp?user_id="+user_ids);
}
	}

}
