package jforum;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Model.FileUpload2;
import com.connection.Database;

/**
 * Servlet implementation class GroupProfilePic
 */
public class GroupProfilePic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statement st = null;
	Connection con=null;
	ResultSet rs=null;
	   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupProfilePic() {
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

		try
    	{
    	st=Database.dbconnect();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		
		// TODO Auto-generated method stub
	
		try
		{
			
		response.setContentType("text/html");
		boolean isMultiPart=ServletFileUpload.isMultipartContent(request);
		
		if(isMultiPart)
		{
		  ServletFileUpload upload= new ServletFileUpload();
		  try{
			  FileItemIterator itr= upload.getItemIterator(request);
			  while(itr.hasNext())
			  {
				org.apache.commons.fileupload.FileItemStream item=itr.next();
				 if(item.isFormField()){
					  String fieldName=item.getFieldName();
					 InputStream is=item.openStream();
					 byte[] b=new byte[is.available()];
					 is.read(b);
					 
					  String value=new String(b);
					  response.getWriter().println(fieldName+":"+value+"<br/>");
					  
				 }
				 else{
					 // upload
					
					 String path=getServletContext().getRealPath("/");
						response.getWriter().println("path"+path);
					
					 
					 
					 
					 
					
					
					   String filename=FileUpload2.processFile(path, item);
		            
					   String user_ids=request.getParameter("user_id");
					   String group_ids=request.getParameter("group_id");
						
					   	Integer user_id=Integer.parseInt(user_ids);
					   	Integer group_id=Integer.parseInt(group_ids);

					  // boolean recordInserted = false;
				      try{
				
						String str="update groups set profilepic='"+filename+"' where user_id="+user_id;
						int i=st.executeUpdate(str);
					
						if(i!=0)
						{

							response.getWriter().println("inserted"+user_ids);
							
							response.sendRedirect("group/groups.jsp?user_id="+user_ids+"&group_id="+group_id);

		
						}
						else{
							response.getWriter().println("not inserted");
						}
						
					   

				   }catch(SQLException e){
					   e.printStackTrace();
				      }
				      finally{
				    	  try {
				    	  
				    	  } catch(Exception e){
				    		  e.printStackTrace();
				    	  }
				      }
				      
					   
					   }
					
				}
			  }
		 
		
		  catch(FileUploadException ex)
		  {
			  ex.printStackTrace();
		  }
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	
	}

	}


