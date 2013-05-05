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
/**
 * Servlet implementation class GroupCreate
 */
public class GroupCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	  Statement st=null;
	 
	
    public GroupCreate()
    {
      	st=Database.dbconnect();
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		int group_id=0;
		String group_name=request.getParameter("group_name");
		String user_ids=request.getParameter("user_id");
		int user_id=Integer.parseInt(user_ids);
		String sql2;
		String sql1="insert into groups (user_id,group_name) values ('"+user_id+"','"+group_name+"')";
		try 
		{
			st.executeUpdate(sql1);
			sql2="select group_id from groups ORDER BY group_id DESC ";
			rs=st.executeQuery(sql2);
			rs.next();
			group_id=rs.getInt("group_id");
		} 
		catch (SQLException e) 
		{
			out.println("ero");
			e.printStackTrace();
		}
		
		String group_ids=Integer.toString(group_id);
		out.println("gid:"+group_ids);
		response.sendRedirect("group/groups.jsp?group_id="+group_ids+"&user_id="+user_ids);
	}

}
