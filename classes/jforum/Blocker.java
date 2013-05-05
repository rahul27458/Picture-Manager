package jforum;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Blocker extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String s;
	Connection con ;
	Statement st;
	ResultSet rs;
	PrintWriter out ;   
	
	  
  
  public Blocker() 
  {
	  try
		{
			Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
		} 
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} 
		catch (InstantiationException e) 
		{
			e.printStackTrace();
		} 
		catch (IllegalAccessException e) 
		{
			e.printStackTrace();
		}
		try
		{
			 con = DriverManager.getConnection("jdbc:db2://localhost:50000/TESTDB1","root","root"); 
			 st= con.createStatement(); 
		}
catch(Exception e){}


  }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emd="";
		PrintWriter out=response.getWriter();
		
		try
		{
			
			    String like_temp = request.getParameter("likeuid");
			    emd = request.getParameter("likeemd");	
				int like1=Integer.parseInt(like_temp);
				String sql1="UPDATE image_upload SET likes= likes + 1 WHERE image_id='"+like1+"'";
				String sqlret2="insert into likes values('"+like1+"','"+emd+"')";
				st.executeUpdate(sql1);
				st.executeUpdate(sqlret2);
		}
		catch (SQLException e) 
		{
				e.printStackTrace();
				out.println(e);
		}
		response.sendRedirect("reportlike.jsp");
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
				int report1=Integer.parseInt(report_temp);
		        String sql1="UPDATE imageupload SET report= report + 1 WHERE image_id='"+report1+"'";
			    String sqlret2="insert into reports values('"+report1+"','"+emd+"')";
			    st.executeUpdate(sql1);
				st.executeUpdate(sqlret2);
		}
		catch(SQLException e){
			out.println(e);
		}
		
		
		response.sendRedirect("reportlike.jsp");

		
	}

}
