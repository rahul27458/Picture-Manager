package com.video;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.Database;

/**
 * Servlet implementation class VideoServlet
 */
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
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
					
					 String path=getServletContext().getRealPath("/");
					 if(VideoUpload.processFile(path, item))
					 {response.getWriter().println("file uploaded sucessfully");
					   response.getWriter().println(item.getName());
					 
					   int id=1;
					   String filename=item.getName();
		            

					  // boolean recordInserted = false;
				      try{
						 Statement st=Database.dbconnect();
						String str=("insert into video_upload(user_id,filename) values('"+id+"','"+filename+"')");
						int i=st.executeUpdate(str);
						if(i!=0)
						{
							
							response.getWriter().print("Uploaded file");
						}
						else{
							response.getWriter().println("not inserted");
						}
						
					   

				   }catch(SQLException e){
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

	}


