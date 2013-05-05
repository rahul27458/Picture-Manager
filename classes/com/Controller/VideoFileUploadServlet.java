package com.Controller;
import java.sql.*;					

import java.io.IOException;
import java.io.InputStream;

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
 * Servlet implementation class VideoFileUploadServlet
 */
//@WebServlet("/FileUploadServlet")
public class VideoFileUploadServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoFileUploadServlet() {
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
					 ;
					 String path=getServletContext().getRealPath("/");
				
					   String filename=FileUpload2.processFile(path, item);
					   String user_ids=request.getParameter("fuid");
						
					   	Integer user_id=Integer.parseInt(user_ids);

						   String group_ids=request.getParameter("group_ids");
							
						   	Integer group_id=Integer.parseInt(group_ids);

					  // boolean recordInserted = false;
				      try{
						 Statement st=Database.dbconnect();
						String str=("insert into videoupload(filename,user_id,group_id) values('"+filename+"','"+user_id+"','"+group_id+"')");
						
                                                 int i=st.executeUpdate(str);
						if(i!=0)
						{
							
							response.getWriter().print("Uploaded file");
							response.sendRedirect("GroupRedirect?user_id="+user_ids+"&group_ids="+group_id);
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
		 
		  catch(FileUploadException ex)
		  {
			  ex.printStackTrace();
		  } 
	}
	
	}

}
