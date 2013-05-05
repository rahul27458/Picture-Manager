package homepage;


import java.sql.*;					
import com.connection.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.Model.FileUpload2;


public class HomeFileUploadServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	Statement st = null;
	Connection con=null;
	ResultSet rs=null;
	  
    public HomeFileUploadServlet() {
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//PrintWriter out=response.getWriter();
		
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
		            
					   String user_ids=request.getParameter("fuid");
						
					   	Integer user_id=Integer.parseInt(user_ids);

					  // boolean recordInserted = false;
				      try{
				
						String str=("insert into imageupload(filename,user_id) values('"+filename+"','"+user_id+"')");
						int i=st.executeUpdate(str);
					
						if(i!=0)
						{

							response.getWriter().println("inserted"+user_ids);
							
							response.sendRedirect("homepage.jsp?user_id="+user_ids);

		
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
